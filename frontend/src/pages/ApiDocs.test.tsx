import { render, screen } from '@testing-library/react';
import ApiDocs from './ApiDocs';

jest.mock('swagger-ui-react', () => ({
  __esModule: true,
  default: ({ spec }: { spec: { info: { title: string }; paths: Record<string, unknown> } }) => (
    <>
      <h1>{spec.info.title}</h1>
      <ul>
        {Object.keys(spec.paths).map((path) => (
          <li key={path}>{path}</li>
        ))}
      </ul>
    </>
  ),
}));

it('shows the API documentation and a link back to ProTube', () => {
  render(<ApiDocs />);
  expect(screen.getByRole('heading', { name: 'ProTube API' })).toBeInTheDocument();
  expect(screen.getByText('/api/auth/login')).toBeInTheDocument();
  expect(screen.getByText('/api/videos/upload')).toBeInTheDocument();
  expect(screen.getByText('/api/comments/{commentId}/like')).toBeInTheDocument();
  expect(screen.getByRole('link', { name: 'Torna a ProTube' })).toHaveAttribute('href', '/');
});
