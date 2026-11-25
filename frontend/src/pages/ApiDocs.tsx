import SwaggerUI from 'swagger-ui-react';
import 'swagger-ui-react/swagger-ui.css';
import { getOpenApiSpec } from './openApi';

const spec = getOpenApiSpec();

export default function ApiDocs() {
  return (
    <main>
      <nav className="container py-3" aria-label="Navegació">
        <a href="/">Torna a ProTube</a>
      </nav>
      <SwaggerUI
        spec={spec}
        docExpansion="list"
        supportedSubmitMethods={['get']}
        withCredentials
      />
    </main>
  );
}
