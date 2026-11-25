import { getEnv } from '../utils/Env';

const string = { type: 'string' };
const uuid = { type: 'string', format: 'uuid' };
const session = [{ session: [] }];
const parameter = (name: string, schema: { type: string; format?: string } = uuid) =>
  ({ name, in: 'path', required: true, schema });
const ref = (name: string) => ({ $ref: `#/components/schemas/${name}` });
const array = (items: object) => ({ type: 'array', items });
const json = (schema: object) => ({ 'application/json': { schema } });
const payload = (schema: object) => ({ required: true, content: json(schema) });
const response = (description: string, schema?: object) => ({
  description,
  ...(schema && { content: json(schema) }),
});
const comment = payload({
  type: 'object',
  required: ['content'],
  properties: { content: { ...string, minLength: 1, maxLength: 1000 } },
});
const createdComment = { 201: response('Comentari creat', ref('Comment')), 400: response('Contingut invàlid') };
const likeResponse = { 200: response('Estat actualitzat', ref('CommentLike')), 404: response('Comentari no trobat') };

export function getOpenApiSpec() {
  return {
    openapi: '3.0.3',
    info: {
      title: 'ProTube API',
      version: '0.0.2',
      description: 'Referència de l’API HTTP. Les operacions amb cadenat fan servir la sessió iniciada amb Google a ProTube.',
    },
    servers: [{ url: getEnv().API_BASE_URL.replace(/\/api$/, '') || '/' }],
    paths: {
      '/api/auth/login': {
        post: { tags: ['Sessió'], summary: 'Inicia el login amb Google al navegador', responses: { 302: response('Redirecció OAuth2') } },
      },
      '/logout': {
        post: { tags: ['Sessió'], summary: 'Tanca la sessió de ProTube', security: session, responses: { 302: response('Redirecció després del logout') } },
      },
      '/api/users/me': {
        get: { tags: ['Usuaris'], summary: 'Consulta el perfil de la sessió actual', security: session, responses: { 200: response('Perfil', ref('User')) } },
      },
      '/api/users/{userId}': {
        parameters: [parameter('userId')],
        patch: { tags: ['Usuaris'], summary: 'Actualitza el perfil', security: session, requestBody: payload(ref('User')), responses: { 200: response('Perfil actualitzat', ref('User')) } },
      },
      '/api/users/{userId}/darkMode': {
        parameters: [parameter('userId')],
        patch: { tags: ['Usuaris'], summary: 'Alterna el mode fosc del perfil', security: session, responses: { 200: response('Preferència actualitzada') } },
      },
      '/api/videos': {
        get: { tags: ['Vídeos'], summary: 'Llista els vídeos actius', responses: { 200: response('Vídeos', array(ref('Video'))) } },
      },
      '/api/videos/{videoId}': {
        get: { tags: ['Vídeos'], summary: 'Consulta un vídeo actiu', parameters: [parameter('videoId')], responses: { 200: response('Vídeo', ref('Video')), 404: response('Vídeo no trobat') } },
        patch: { tags: ['Vídeos'], summary: 'Respon a la sol·licitud d’eliminació', description: 'El controlador actual retorna un missatge de confirmació.', parameters: [parameter('videoId', string)], security: session, responses: { 200: response('Missatge de confirmació') } },
      },
      '/api/videos/search/{query}': {
        parameters: [parameter('query', string)],
        get: { tags: ['Vídeos'], summary: 'Cerca vídeos actius pel títol', responses: { 200: response('Coincidències', array(ref('Video'))) } },
      },
      '/api/videos/upload': {
        post: {
          tags: ['Vídeos'], summary: 'Puja un vídeo i les seves metadades', security: session,
          requestBody: { required: true, content: { 'multipart/form-data': {
            schema: { type: 'object', required: ['metadata', 'file'], properties: {
              metadata: ref('VideoMetadata'), file: { type: 'string', format: 'binary' },
            } },
            encoding: { metadata: { contentType: 'application/json' } },
          } } },
          responses: { 201: response('Vídeo creat', ref('Video')), 404: response('Usuari no trobat') },
        },
      },
      '/api/videos/{videoId}/comments': {
        parameters: [parameter('videoId')],
        get: { tags: ['Comentaris'], summary: 'Llista els comentaris i les seves respostes', responses: { 200: response('Comentaris', array(ref('Comment'))), 404: response('Vídeo no trobat') } },
        post: { tags: ['Comentaris'], summary: 'Publica un comentari al vídeo', security: session, requestBody: comment, responses: { ...createdComment, 404: response('Vídeo o usuari no trobat') } },
      },
      '/api/comments/{commentId}/replies': {
        parameters: [parameter('commentId')],
        post: { tags: ['Comentaris'], summary: 'Respon a un comentari principal', security: session, requestBody: comment, responses: { ...createdComment, 404: response('Comentari o usuari no trobat'), 422: response('El comentari ja és una resposta') } },
      },
      '/api/comments/{commentId}/like': {
        parameters: [parameter('commentId')],
        put: { tags: ['Comentaris'], summary: 'Marca un comentari amb un m’agrada', security: session, responses: likeResponse },
        delete: { tags: ['Comentaris'], summary: 'Retira el m’agrada d’un comentari', security: session, responses: likeResponse },
      },
      '/api/hello': {
        get: { tags: ['Proves'], summary: 'Retorna el missatge de prova del backend', security: session, responses: { 200: response('Missatge de text') } },
      },
    },
    components: {
      securitySchemes: { session: { type: 'apiKey', in: 'cookie', name: 'JSESSIONID' } },
      schemas: {
        User: { type: 'object', properties: {
          id: uuid, googleSubject: string, email: string, name: string, lastname: string, pictureUrl: string, dark_mode: { type: 'boolean' },
        } },
        Video: { type: 'object', properties: {
          id: uuid, title: string, duration: { type: 'integer' }, description: string, thumbnail: string,
          channelName: string, viewsCount: { type: 'integer' }, likeCount: { type: 'integer' },
          categories: array(string), uploadDate: { ...string, format: 'date-time' }, videoUrl: string,
        } },
        VideoMetadata: { type: 'object', required: ['title', 'duration', 'thumbnail', 'meta'], properties: {
          title: string, duration: { type: 'integer' }, thumbnail: string,
          meta: { type: 'object', properties: { description: string, categories: array(string), tags: array(string) } },
        } },
        Comment: { type: 'object', properties: {
          id: uuid, author: { type: 'object', properties: { userId: uuid, name: string, pictureUrl: string } },
          content: string, createdAt: { ...string, format: 'date-time' }, replies: array(ref('Comment')),
          likeCount: { type: 'integer' }, likedByCurrentUser: { type: 'boolean' },
        } },
        CommentLike: { type: 'object', properties: {
          commentId: uuid, likeCount: { type: 'integer' }, likedByCurrentUser: { type: 'boolean' },
        } },
      },
    },
  };
}
