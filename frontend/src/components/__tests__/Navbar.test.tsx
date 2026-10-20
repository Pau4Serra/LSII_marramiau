import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import Navbar from '../Navbar';

describe('Navbar component', () => {
  it('renders branding, search bar and login button', () => {
    render(<Navbar />);

    expect(screen.getByAltText('ProTube Logo')).toBeInTheDocument();
    expect(screen.getByText('ProTube')).toBeInTheDocument();
    expect(screen.getByPlaceholderText('')).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /search button/i })).toBeInTheDocument();
    expect(screen.getByRole('button', { name: /log in/i })).toBeInTheDocument();
  });

  it('handles search input and form submission', () => {
    const handleSearch = jest.fn();
    render(<Navbar onSearch={handleSearch} />);

    const input = screen.getByLabelText('Search');
    fireEvent.change(input, { target: { value: 'cat videos' } });
    expect(input).toHaveValue('cat videos');

    const searchBtn = screen.getByRole('button', { name: /search button/i });
    fireEvent.click(searchBtn);
    expect(handleSearch).toHaveBeenCalledWith('cat videos');
  });

  it('handles login button click', () => {
    const handleLogin = jest.fn();
    render(<Navbar onLoginClick={handleLogin} />);

    const loginBtn = screen.getByRole('button', { name: /log in/i });
    fireEvent.click(loginBtn);
    expect(handleLogin).toHaveBeenCalledTimes(1);
  });
});
