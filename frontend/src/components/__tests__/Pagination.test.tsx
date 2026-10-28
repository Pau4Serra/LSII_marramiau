import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import Pagination, { getPageNumbers } from '../Pagination';

describe('Pagination component', () => {
  it('returns null when totalPages is 1 or less', () => {
    const { container: c1 } = render(<Pagination currentPage={1} totalPages={1} onPageChange={jest.fn()} />);
    expect(c1.firstChild).toBeNull();

    const { container: c0 } = render(<Pagination currentPage={1} totalPages={0} onPageChange={jest.fn()} />);
    expect(c0.firstChild).toBeNull();
  });

  it('renders page numbers, active state, and handles navigation clicks', () => {
    const onPageChange = jest.fn();
    render(<Pagination currentPage={1} totalPages={3} onPageChange={onPageChange} />);

    const prevBtn = screen.getByRole('button', { name: 'Pàgina anterior' });
    const nextBtn = screen.getByRole('button', { name: 'Pàgina següent' });

    expect(prevBtn).toBeDisabled();
    expect(nextBtn).toBeEnabled();

    const page1Btn = screen.getByRole('button', { name: 'Pàgina 1' });
    const page2Btn = screen.getByRole('button', { name: 'Pàgina 2' });
    const page3Btn = screen.getByRole('button', { name: 'Pàgina 3' });

    expect(page1Btn).toHaveClass('pagination-btn--active');
    expect(page1Btn).toHaveAttribute('aria-current', 'page');
    expect(page3Btn).toBeInTheDocument();

    fireEvent.click(page2Btn);
    expect(onPageChange).toHaveBeenCalledWith(2);

    fireEvent.click(nextBtn);
    expect(onPageChange).toHaveBeenCalledWith(2);
  });

  it('disables next button on the last page and handles previous click', () => {
    const onPageChange = jest.fn();
    render(<Pagination currentPage={3} totalPages={3} onPageChange={onPageChange} />);

    const prevBtn = screen.getByRole('button', { name: 'Pàgina anterior' });
    const nextBtn = screen.getByRole('button', { name: 'Pàgina següent' });

    expect(prevBtn).toBeEnabled();
    expect(nextBtn).toBeDisabled();

    fireEvent.click(prevBtn);
    expect(onPageChange).toHaveBeenCalledWith(2);
  });

  it('renders ellipsis when there are many pages', () => {
    render(<Pagination currentPage={5} totalPages={10} onPageChange={jest.fn()} />);

    const ellipses = screen.getAllByText('…', { selector: '.pagination-ellipsis' });
    expect(ellipses).toHaveLength(2);
  });

  describe('getPageNumbers algorithm', () => {
    it('returns all pages when totalPages <= 7', () => {
      expect(getPageNumbers(1, 5)).toEqual([1, 2, 3, 4, 5]);
      expect(getPageNumbers(3, 7)).toEqual([1, 2, 3, 4, 5, 6, 7]);
    });

    it('returns initial range with ellipsis when currentPage <= 4 and totalPages > 7', () => {
      expect(getPageNumbers(2, 10)).toEqual([1, 2, 3, 4, 5, '...', 10]);
      expect(getPageNumbers(4, 10)).toEqual([1, 2, 3, 4, 5, '...', 10]);
    });

    it('returns ending range with ellipsis when currentPage >= totalPages - 3', () => {
      expect(getPageNumbers(7, 10)).toEqual([1, '...', 6, 7, 8, 9, 10]);
      expect(getPageNumbers(9, 10)).toEqual([1, '...', 6, 7, 8, 9, 10]);
    });

    it('returns middle range with two ellipses when currentPage is in the middle', () => {
      expect(getPageNumbers(5, 10)).toEqual([1, '...', 4, 5, 6, '...', 10]);
      expect(getPageNumbers(6, 12)).toEqual([1, '...', 5, 6, 7, '...', 12]);
    });
  });
});
