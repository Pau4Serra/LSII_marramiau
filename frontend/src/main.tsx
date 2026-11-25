import { lazy, StrictMode, Suspense } from 'react';
import { createRoot } from 'react-dom/client';
import App from './App.tsx';
import 'bootstrap/dist/css/bootstrap.css';

const ApiDocs = lazy(() => import('./pages/ApiDocs'));
const isDocs = /^\/docs\/?$/.test(window.location.pathname);

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    {isDocs ? (
      <Suspense fallback={<p role="status">Carregant la documentació…</p>}>
        <ApiDocs />
      </Suspense>
    ) : <App />}
  </StrictMode>
);
