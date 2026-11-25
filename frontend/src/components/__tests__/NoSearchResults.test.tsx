import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import NoSearchResults from '../NoSearchResults';

describe('NoSearchResults component', () => {
  it('renders the title, the hint and the illustration', () => {
    render(<NoSearchResults />);
    expect(screen.getByRole('heading', { name: 'No videos found' })).toBeInTheDocument();
    expect(screen.getByText(/Try searching again with different words/)).toBeInTheDocument();
    expect(screen.getByTestId('no-search-results-icon')).toBeInTheDocument();
    expect(screen.getByRole('status')).toBeInTheDocument();
  });

  it('shows the searched term when a query is given', () => {
    render(<NoSearchResults query="  gatitos voladores  " />);
    expect(screen.getByText(/We couldn't find any results for/)).toBeInTheDocument();
    expect(screen.getByText('"gatitos voladores"')).toBeInTheDocument();
  });

  it('does not show the searched term line when the query is empty', () => {
    render(<NoSearchResults query="   " />);
    expect(screen.queryByText(/We couldn't find any results for/)).not.toBeInTheDocument();
  });
});
