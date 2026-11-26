# ProTube — Contexto técnico de traspaso para Codex

**Fecha de corte:** 25 de noviembre de 2026.  
**Proyecto:** Marramiau / ProTube (plataforma de vídeo tipo YouTube).  
**Repositorio:** `Pau4Serra/LSII_marramiau`.  
**Rama de trabajo:** `PTB-43-tech-debt-reengineering-on-video-gathering-front-to-back`.  
**Referencia de la última revisión del árbol:** `992c9be449d2d3a539ea5d6b06574c64b1c4bb8d` (SHA del árbol, no necesariamente SHA del commit).  
**Enlace:** https://github.com/Pau4Serra/LSII_marramiau/tree/PTB-43-tech-debt-reengineering-on-video-gathering-front-to-back

## 0. Cómo utilizar este documento

Este documento resume las decisiones definitivas de una conversación extensa con ChatGPT y sirve para continuar el desarrollo en Codex sin volver a discutir arquitecturas ya descartadas. No sustituye al código actual: primero inspecciona el checkout, el diff, `AGENTS.md` y el paquete de cambios preparado.

**Distingue tres estados:**

- **Base revisada:** código visto en GitHub antes de preparar el paquete. El usuario había hecho merge de `develop` hacia su rama, por eso reaparecieron componentes relacionados con archivos locales y se incorporó el sistema de comentarios.
- **Cambios preparados:** el archivo `protube-local-oci.zip` contiene una propuesta de implementación, con código, tests y guía. No hay confirmación de que se haya aplicado al checkout, subido a GitHub o desplegado a OCI. El archivo no es un parche Git automático: es un conjunto de archivos que se superponen al repositorio y una lista de eliminaciones.
- **Pendiente:** pruebas Maven, SQL real en H2/PostgreSQL, ejecución Compose y despliegue/integración en el servidor real. No des por hecho que funcionan solo porque el código esté escrito.

La última versión del ZIP se ha vuelto a inspeccionar al redactar este documento. Las secciones que describen la propuesta implementada corresponden a sus archivos reales. La información del servidor remoto procede del código y los comandos que el usuario facilitó en la conversación, no de una nueva conexión SSH. No se ha consultado una revisión posterior del repositorio para este documento.

### Instrucciones de trabajo para Codex

- Conserva la arquitectura Controller → Service → Repository, devuelve DTOs y no entidades JPA directamente. Respeta los `AGENTS.md` del repositorio.
- El usuario prefiere cambios pequeños, directos, comprensibles y ajustados al código existente; evitar librerías, infraestructura, capas o clases innecesarias. No recuperar una solución descartada sin justificarlo y consultarlo.
- Mantén la compatibilidad con `develop` y el trabajo de los compañeros; no reviertas cambios ajenos de comentarios o frontend.
- No hagas push a `main`, no borres datos de producción, no ejecutes resets globales ni despliegues sin autorización. Sigue la convención de commits del equipo.
- No añadas claves privadas, credenciales reales, cookies, tokens Google o archivos `.env` al repositorio. No necesitas pedirlos para revisar código.
- Trabaja primero sobre el estado real de la rama. Si el usuario ya aplicó parte del ZIP, integra solo lo que falte; no sobrescribas cambios posteriores.
- Antes de dar una tarea por terminada, ejecuta las pruebas posibles y declara claramente qué no se pudo verificar. No confundir una comprobación local de FastAPI con un despliegue real.

## 1. Objetivo y requisitos definitivos

ProTube debe seguir utilizando Spring Boot como backend principal, con Google OAuth2/OIDC para la autenticación y JPA para la persistencia. OCI se utiliza únicamente como almacenamiento de archivos multimedia. No se quiere desplegar el backend Spring Boot en OCI para resolver esta tarea.

Se requiere:

1. Poder seleccionar almacenamiento **LOCAL u OCI** mediante una propiedad del entorno, independientemente del perfil de BBDD `dev` o `prod`.
2. Utilizar un **patrón Strategy convencional** con un contexto que elija la estrategia una vez al arrancar. Sin `@ConditionalOnProperty` y sin Factory explícita adicional.
3. Conservar una única identidad de vídeo entre BBDD y almacenamiento. Los vídeos iniciales tienen UUID deterministas; los vídeos nuevos tienen UUID aleatorios generados desde Spring/JPA, no desde OCI.
4. Subir vídeo y miniatura en una sola petición multipart desde el frontend hacia Spring, y en una sola petición multipart desde Spring hacia FastAPI en modo OCI.
5. Almacenar el MP4 y el WEBP juntos bajo el mismo UUID; exponer URLs predecibles por HTTPS mediante Nginx.
6. Preparar un dataset desde una carpeta local existente que contiene tripletas `.json`, `.mp4`, `.webp` con el mismo nombre base. No depender de videoGrabber, que actualmente no le funciona al usuario.
7. Preparar los archivos una sola vez: comprobar existencia antes de copiar/subir, generar UUID estáticos y SQL de inicialización con relaciones entre canales, vídeos, categorías y comentarios.
8. Inicializar H2 de desarrollo al arrancar Spring Boot mediante SQL; inicializar PostgreSQL mediante SQL idempotente, después de las migraciones de esquema. No modificar registros existentes ni duplicarlos.
9. Mantener las relaciones y lógica de comentarios existente. Recuperarlos mediante su API asociada a cada vídeo; no hacer que el listado general de vídeos cargue todos los comentarios.
10. Implementar DELETE de vídeo en Spring, con autorización del propietario, y DELETE de archivos en FastAPI. Mantener baja lógica en BBDD (`REMOVED`) y borrado físico del par multimedia.
11. Proporcionar un script administrativo manual para eliminar todos los vídeos/miniaturas o uno concreto, con vista previa y confirmación. No limpiar automáticamente OCI al arrancar ni en DEV ni en PROD.
12. Mantener H2 en memoria si se puede ejecutar el SQL desde la JVM. PostgreSQL conserva los registros mediante su volumen persistente.

## 2. Decisiones acordadas frente a alternativas descartadas

| Tema | Decisión vigente | Alternativa descartada o no elegida |
|---|---|---|
| Almacenamiento | Strategy LOCAL/OCI mediante un contexto y un `switch` | `@ConditionalOnProperty`; Factory explícita; `if (oci)` dispersos |
| Identidad | UUID común entre entidad y archivos; UUID v5 para seed | UUID independiente generado por FastAPI |
| Generación JPA | Mantener `@GeneratedValue` y reservar entidad PENDING antes de subir (decisión de implementación del ZIP) | Quitar el generador y asignar a mano UUID a todas las entidades nuevas |
| Datos de negocio | H2 o PostgreSQL detrás de Spring | Base de datos adicional en OCI; duplicar usuarios o comentarios en FastAPI |
| Dataset | Tripletas locales + script Python que genera SQL | Depender de videoGrabber para ejecutar el seeder; leer JSON en cada arranque Java |
| Catálogo | Consultar Spring `/api/videos` respaldado por BBDD | `catalog.json` en OCI, `/api/catalog` |
| Inicio DEV | SQL ejecutado por Spring en H2 in-memory | Servidor TCP H2 externo innecesario para este caso; `DevDataLoader` |
| Inicio PROD | Migración Flyway + seeder SQL por Compose | `/docker-entrypoint-initdb.d/` como mecanismo exclusivo (solo se ejecuta en volumen vacío) |
| Estructura OCI | `videos/{uuid}/video.mp4` y `thumbnail.webp` | Workspaces por desarrollador, carpetas catalog/dev/prod y `/api/dev/sessions` |
| Limpieza | Manual, coordinada | Eliminar huérfanos globalmente al iniciar con H2 individual |
| Autenticación | Google OIDC en Spring; clave privada de servicio en FastAPI | Crear usuarios en OCI; exigir token de usuario para ejecutar seeder al arrancar |
| Upload | Un multipart con metadata + vídeo + miniatura en Spring | Dos requests desde frontend; JSON manual como String/Jackson para arreglar Postman |
| Comentarios | Relación JPA existente y API específica | Duplicar lógica de comentarios en OCI o incluirlos en todos los listados |
| Infraestructura | FastAPI, Nginx y disco existentes | S3, Redis, broker, otro backend o BBDD en OCI |

**Matiz importante:** el usuario planteó originalmente una limpieza automática de huérfanos en DEV, pero después aceptó que sea manual. El almacenamiento es compartido y una BBDD H2 local no puede identificar todos los archivos referenciados por otros desarrolladores o por producción. No reintroducir esa limpieza automática.

## 3. Infraestructura OCI existente (antes del paquete)

- VM Ubuntu aarch64/ARM64. IP pública usada para SSH: `158.179.219.206`, usuario `ubuntu`, hostname visto en shell `srv`.
- Aproximadamente 11 GiB RAM, volumen raíz de 45 GB, volumen de datos ext4 de 147 GB montado en `/mnt/data` (capacidad libre histórica ~123 GB, comprobar antes de operar).
- Directorio FastAPI: `/opt/protube-media/`, archivo `app.py`.
- Nginx HTTPS, DuckDNS `marramiau-protube.duckdns.org`, certificado Let's Encrypt gestionado por Certbot.
- FastAPI escuchando detrás de Nginx en `127.0.0.1:8001`. No hay que exponer directamente ese puerto.
- Directorio raíz de multimedia: `/mnt/data/video-platform/`, con `api-tmp/`, `tmp/`, `videos/`.
- El usuario ya probó el acceso SSH y solucionó un error `UNPROTECTED PRIVATE KEY FILE` en Windows debido a ACL de `CodexSandboxUsers`. La clave privada permanece local; no copiarla al repo ni incluirla en este documento.
- Se había comprobado la publicación HTTPS de archivos (p.ej. `/media/test.txt`) y el endpoint de salud; el usuario indicó después que había resuelto los errores de Postman. No tenemos una respuesta 201 registrada en el chat que permita afirmar una prueba integral completa de la última propuesta.
- Antes se exploró un usuario SFTP limitado, pero la arquitectura de aplicación utiliza HTTPS; los compañeros no deben necesitar acceso SSH para usar la API.
- Se desconoce el nombre exacto del servicio systemd, su usuario de ejecución, su venv y el EnvironmentFile efectivo. Inspeccionar el servidor en vez de asumirlos.

### 3.1. Configuración Nginx aportada por el usuario

Archivo `/etc/nginx/sites-enabled/media` (equivalente al original, conservando las directivas relevantes):

```nginx
server {
    server_name marramiau-protube.duckdns.org;

    location /media/ {
        alias /mnt/data/video-platform/videos/;
        autoindex off;
        sendfile on;
        add_header Accept-Ranges bytes;
        add_header Cache-Control "public, max-age=3600";
    }
    location /api/ {
        client_max_body_size 110m;
        proxy_pass http://127.0.0.1:8001;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_request_buffering off;
        proxy_read_timeout 600s;
    }
    location / { return 404; }
    listen 443 ssl;
    ssl_certificate /etc/letsencrypt/live/marramiau-protube.duckdns.org/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/marramiau-protube.duckdns.org/privkey.pem;
    include /etc/letsencrypt/options-ssl-nginx.conf;
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;
}
server {
    if ($host = marramiau-protube.duckdns.org) {
        return 301 https://$host$request_uri;
    }
    listen 80;
    server_name marramiau-protube.duckdns.org;
    return 404;
}
```

No es necesario cambiar el `alias` para servir los nuevos subdirectorios UUID. La caché de una hora implica que un contenido ya descargado podría seguir accesible en cachés después del borrado. Los archivos son públicos para quien tenga su URL; no hay vídeos privados por ahora. Nginx debe poder leer/travesar el árbol de almacenamiento. Validar tipos MIME y Range con las pruebas reales.

### 3.2. FastAPI actualmente instalado según el usuario (contrato antiguo)

`app.py` utiliza `os`, `uuid`, `subprocess`, `pathlib`, FastAPI y `google.oauth2.id_token`.

- `STORAGE = Path("/mnt/data/video-platform/videos")`.
- Variables `MEDIA_BASE_URL`, `GOOGLE_CLIENT_ID`.
- Límite de vídeo `100 * 1024 * 1024` bytes.
- `GET /api/health` → `{"status":"ok"}`.
- `POST /api/videos` → 201. Recibe solo `file` multipart, `Authorization: Bearer <Google ID token>`. Valida el token mediante `verify_oauth2_token(token, requests.Request(), CLIENT_ID)` y `email_verified`.
- Exige `file.content_type == "video/mp4"`; genera `uuid.uuid4().hex` de forma independiente.
- Escribe en `.{video_id}.part` en el directorio de vídeos, lee en bloques de 1 MiB, rechaza >100 MiB con 413, usa `ffprobe` con timeout 20s para comprobar la existencia de stream de vídeo, renombra a `{video_id}.mp4` y elimina temporal en `finally`.
- Respuesta antigua: `{"id": "<uuid hex>", "url": "https://marramiau-protube.duckdns.org/media/<uuid hex>.mp4"}`.
- No gestiona miniaturas ni DELETE. No guarda metadatos ni relaciones con la BBDD Java.

El contrato antiguo y el del ZIP **no son compatibles entre sí**. Coordinar el cambio de backend y FastAPI con los compañeros. No borrar el almacenamiento plano antiguo sin revisar las referencias persistentes.

## 4. Estado del repositorio antes del ZIP

### 4.1. Stack y estructura

- Monorepo `backend/` y `frontend/` (React, TypeScript, Vite).
- Java 21, Spring Boot 3.3.3, Maven, Spring MVC/Security OAuth2 Client, JPA/Hibernate, H2, PostgreSQL, Flyway.
- Paquete Java exacto: `com.tecnocampus.LS2.protube_back`.
- Directorio de repositorios con el nombre existente `persistance` (no renombrar sin motivo).
- Perfil DEV: H2 `jdbc:h2:mem:mydb;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE`, `ddl-auto: update`, Flyway desactivado, puerto 8080.
- Perfil PROD: PostgreSQL, `ddl-auto: validate`, Flyway, puerto 8090. Compose usa `postgres:16` y volumen `postgres_data`.
- Login OAuth2 con Google, scopes openid/profile/email; `GoogleLoginSuccessHandler` gestiona el usuario local; sesión `JSESSIONID` en lugar de JWT propio. No crear un segundo sistema de autenticación para la app.
- `SecurityConfig` ya contiene CORS para `localhost:5173` y `127.0.0.1:5173`, con credenciales. GET de vídeos público, escrituras autenticadas. CSRF está desactivado en la base revisada; riesgo pendiente de revisión, especialmente en producción con cookies.
- `MvcConfig`, `VideoMetadataDTO` (antiguo DTO de importación) y `AppStartupRunner` ya no aparecían en el árbol revisado. No volver a crearlos. `VideoMetadataRequestDTO` sí sigue siendo necesario.
- Tras el merge de develop existe `DevDataLoader.java` (y `DevDataLoaderTest.java`) que carga JSON locales bajo `@Profile("dev & !prod")`. Crea canales sintéticos y comentarios importados, y compone URLs usando los identificadores numéricos antiguos. Debe desaparecer tras sustituirlo por el seed SQL.
- `tooling/videoGrabber/` existe, pero no es requisito ni se modifica. El usuario ya dispone de una carpeta de datos y no desea depender de este programa.

### 4.2. Clases y endpoints existentes

- `controller/VideosController.java`: `GET /api/videos`, `GET /api/videos/{videoId}`, `GET /api/videos/search/{query}`; `POST /api/videos/upload` con `@RequestPart("metadata") CreateVideoRequestDTO`, `@RequestPart("file") MultipartFile`, `@AuthenticationPrincipal OidcUser`. En esa versión DELETE es un placeholder `@PatchMapping` que no borra nada.
- `services/VideoService.java`: consultas JPA de vídeos `ACTIVE`; upload busca `User` por `principal.getSubject()`, llama al cliente OCI con `principal.getIdToken().getTokenValue()`, crea `Video`, guarda URL remota y el texto `request.thumbnail()`, estado ACTIVE. Problema: dos UUID y no miniatura física. Transacción original cubría la petición remota.
- `services/OciMediaClientService.java`: `RestClient`, `POST /api/videos` con Bearer Google y un MP4; record antiguo `UploadResponse(String id, String url)`.
- `persistance/VideoRepository.java`: `findByStatus`, `findByTitleContainingIgnoreCaseAndStatus`, `findByIdAndStatus`, `findByIdAndChannel_GoogleSubject(UUID,String)`. Este último se reutiliza para verificar propiedad.
- `persistance/UserRepository.java`: `findUserByGoogleSubject(String)`.
- `model/dto/RequestDTO/CreateVideoRequestDTO.java` original: `String title, Integer duration, String thumbnail, VideoMetadataRequestDTO meta`.
- `VideoMetadataRequestDTO`: `String description`, `List<String> categories`, `List<String> tags`, `Long view_count`, `int like_count`, `String channel`, `int channel_follower_count`. Para nuevas subidas no confiar en canal/likes/views aportados por el cliente; canal real se toma del principal y contadores se inicializan en cero.
- `PublicVideoResponseDTO`: UUID `id`, `title`, `int duration`, `description`, `thumbnail`, `channelName`, `Long viewsCount`, `int likeCount`, `List<Category> categories`, `Instant uploadDate`, `videoUrl`. No cambiar formato sin coordinar frontend.
- Frontend observado: `useAllVideos.ts` consulta `/api/videos` y búsqueda; `VideoPage.tsx` consulta detalles y admite URLs absolutas (función `resolveMediaUrl`). El ZIP no modifica frontend. Revisar si el frontend actual ya dispone de UI de subida/comentarios y adaptar únicamente cuando proceda.

### 4.3. Modelo relacional relevante

`Video`: `@Id @GeneratedValue(strategy = GenerationType.UUID) UUID id`; title obligatorio, duration obligatorio, description TEXT, thumbnail obligatorio, videoUrl nullable; `VideoStatus {PENDING, ACTIVE, REMOVED}`, `List<Category>` en `video_categories`, `User channel` ManyToOne LAZY obligatorio con `channel_id`, `viewCount` Long, `likeCount` Integer, `tags` ManyToMany con `video_tags`, `comments` OneToMany LAZY con cascade/orphanRemoval, `uploadDate` obligatorio, `removedDate` opcional.

`User`: UUID generado, `googleSubject` (campo `google_subject`), email, name, lastname, pictureUrl, createdAt/updatedAt/removedAt, `dark_mode`, relaciones con vídeos y comentarios. Los canales del seed son usuarios sintéticos sin cuenta Google válida: `seed-channel:<uuid>` y `<uuid>@catalog.invalid`.

`Comment`: UUID generado, `video_id` obligatorio ManyToOne LAZY, `author_id` nullable, `author_display_name`, `content` TEXT, `parent_id` nullable, replies, likes, `created_at`, `imported_like_count` BIGINT. Los comentarios importados no precisan usuario autenticable.

`CommentLike`: relación comentario/usuario, clave UUID y restricción única comentario+usuario. `CommentService` ya exige vídeo ACTIVE y gestiona comentarios raíz, respuestas de un nivel y likes. `CommentController` dispone de:

- `GET /api/videos/{videoId}/comments`
- `POST /api/videos/{videoId}/comments`
- `POST /api/comments/{commentId}/replies`
- `PUT /api/comments/{commentId}/like`
- `DELETE /api/comments/{commentId}/like`

Se conserva esta implementación. El GET de comentarios se hace público en el ZIP; las escrituras permanecen autenticadas. Si se quiere un DTO detallado con comentarios, discutirlo por separado; no devolver toda la relación en cada listado.

`Tag`: actualmente **solo tiene `id`**. No puede representar el nombre original de etiquetas. Se omite del seed en el ZIP; no crear tags sin significado. Pendiente decidir si ampliar modelo y migraciones.

Migraciones Flyway presentes (no editar migraciones ya aplicadas):

- `V1__create_initial_schema.sql`: tablas users, tag, video, comment, video_categories, video_tags; claves UUID y relaciones.
- `V2__add_video_status.sql`: permite video_url NULL, añade status, añade users.dark_mode.
- `V3__expand_video_description.sql`: description TEXT.
- `V4__expand_comments.sql`: amplía comment, relaciones de autor y padre, añade comment_like e índices. Atención si hay filas previas a V4: añade columnas NOT NULL sin backfill; comprobar en una copia de la base real.

## 5. Diseño definitivo y código del paquete preparado

```text
React -> VideosController -> VideoService -> VideoRepository (H2/PostgreSQL)
                                 |
                         MediaStorageContext
                                 |
                         MediaStorageStrategy
                           /              \
                   LocalMediaStorage    OciMediaClientService
                           |                    |
                     media-store/        HTTPS -> Nginx -> FastAPI
                                                   |
                                           volumen /mnt/data
```

### 5.1. Strategy sin anotación condicional ni Factory

La interfaz real en el ZIP (`services/media/MediaStorageStrategy.java`) tiene:

```java
public interface MediaStorageStrategy {
    void upload(UUID id, MultipartFile video, MultipartFile thumbnail);
    void delete(UUID id);
    boolean exists(UUID id);
    String baseUrl();
    default String videoUrl(UUID id) {
        return baseUrl() + "/media/" + id + "/video.mp4";
    }
    default String thumbnailUrl(UUID id) {
        return baseUrl() + "/media/" + id + "/thumbnail.webp";
    }
}
```

`MediaStorageContext` es un `@Service` que recibe `LocalMediaStorage` y `OciMediaClientService`, lee `@Value("${pro_tube.media.mode:local}")`, normaliza con `strip().toLowerCase(Locale.ROOT)` y selecciona la estrategia por `switch`. Un valor desconocido provoca error en arranque. Delega upload/delete/exists/URLs y expone `isLocal()`.

Se reutiliza `OciMediaClientService` como estrategia; **no existe una clase `OciMediaStorage` separada**. No se introduce `MediaUploadResponse` compartido: las URLs se calculan de forma determinista y el cliente valida la respuesta de OCI.

Ambos beans se crean al arrancar; en local la falta de clave OCI no debe impedir arrancar. La clave se valida al realizar operaciones OCI, no al construir el cliente.

`LocalMediaConfig.java` es una configuración MVC mínima, no usa `@EnableWebMvc`: registra `/media/**` contra el directorio local únicamente si `context.isLocal()`. No recuperar el `MvcConfig` anterior, no duplicar CORS.

### 5.2. Layout de almacenamiento y URLs

```text
/mnt/data/video-platform/            # OCI
├── videos/                          # alias Nginx /media/
│   └── <uuid-canónico-con-guiones>/
│       ├── video.mp4
│       └── thumbnail.webp
├── tmp/                             # staging, fuera de /media/
└── api-tmp/                         # existente

media-store/                         # modo local
└── <mismo-uuid>/
    ├── video.mp4
    └── thumbnail.webp
```

- OCI: `https://marramiau-protube.duckdns.org/media/{uuid}/video.mp4` y `/thumbnail.webp`.
- Local: `http://localhost:8080/media/{uuid}/video.mp4` en DEV; puerto 8090 por defecto en PROD.
- El seed guarda rutas canónicas relativas `/media/{uuid}/...` en SQL. El contexto resuelve esas rutas contra la base URL activa al construir `PublicVideoResponseDTO`. Así los mismos SQL funcionan en ambos modos sin reescribir todos los registros.
- Para nuevas subidas se guardan URLs absolutas de la ubicación real. Cambiar la estrategia no migra esos archivos ni cambia sus URLs. La eliminación se rechaza si la URL persistida no coincide con la ubicación seleccionada o usa formato antiguo.
- El mismo UUID de seed puede compartirse entre H2/PG y los compañeros. El catálogo de la aplicación se obtiene desde BBDD, no desde un manifiesto OCI.

### 5.3. Upload nuevo: contrato Spring y transacciones

```http
POST /api/videos/upload
Content-Type: multipart/form-data; boundary=...
```

Partes:
- `metadata`: JSON con `Content-Type: application/json`, deserializado directamente con `@RequestPart` a `CreateVideoRequestDTO`.
- `file`: MP4, `video/mp4`.
- `thumbnail`: WEBP, `image/webp`.
- Usuario de la sesión Spring: `@AuthenticationPrincipal OidcUser`.

El nuevo `CreateVideoRequestDTO` elimina el campo String `thumbnail` (ahora se recibe el fichero) y conserva `title`, `duration`, `meta`.

`VideoService.uploadVideo(request,file,thumbnail,principal)` del ZIP:
1. Exige sujeto OIDC; valida título no vacío <=255, duración positiva, meta presente, archivo no vacío, MIME y límites (100 MiB MP4 / 5 MiB WEBP).
2. Abre transacción corta con `TransactionTemplate`, busca el usuario, crea entidad `PENDING` con thumbnail vacío y videoUrl null, `saveAndFlush` para que Hibernate genere UUID. Confirma la transacción antes de transferir archivos.
3. Ejecuta `media.upload(id,file,thumbnail)` fuera de la transacción de BBDD.
4. Nueva transacción corta: obtiene entidad, exige estado PENDING, asigna URLs, marca ACTIVE y devuelve el DTO.
5. Ante error, si hay subida confirmada intenta DELETE compensatorio; marca entidad PENDING como REMOVED y anota `removedDate`. Si la respuesta se pierde o falla la compensación, pueden quedar archivos huérfanos: revisión manual. No existe una transacción distribuida entre BBDD y disco/HTTP.

El usuario conserva una única petición desde frontend; las fases anteriores son internas. Se mantiene `@GeneratedValue` en Video, evitando cambios de modelo y tests de repositorio. Para seed los INSERT SQL suministran UUID directamente.

### 5.4. DELETE de Spring

`DELETE /api/videos/{videoId}` devuelve 204. `VideoService.deleteVideo(UUID, OidcUser)` busca por ID y `channel.googleSubject`, 404 si no se encuentra para el propietario. Rechaza PENDING y URLs que no coinciden con la estrategia. Marca `REMOVED` y `removedDate` en una transacción confirmada, luego llama al DELETE del almacenamiento. Un fallo remoto puede reintentarse con el mismo ID: REMOVED no se revierte y el vídeo ya no aparece en las consultas ACTIVE. Los comentarios se conservan en BBDD pero el servicio de comentarios ya bloquea el acceso a vídeos no activos.

Los vídeos iniciales tienen canal sintético no autenticable, por lo que una sesión normal no puede borrarlos físicamente. No crear endpoint masivo de usuario.

### 5.5. Contrato nuevo de FastAPI (ZIP, no desplegado)

| Método | Path | Autenticación | Resultado |
|---|---|---|---|
| GET | `/api/health` | Pública | 200 `{"status":"ok"}` |
| GET | `/api/videos/{video_id}` | `X-API-Key` | 200 y URLs si existe pareja; 404 si no; 409 si incompleta |
| POST | `/api/videos/{video_id}` | `X-API-Key` | 201 con UUID y ambas URLs; 409 si ya existe |
| DELETE | `/api/videos/{video_id}` | `X-API-Key` | 204, idempotente si no existe |

Parámetro de path validado como `uuid.UUID`. POST recibe multipart `file` y `thumbnail`. Respuesta de POST/GET:

```json
{
  "id": "fa8c041e-35bc-49b4-9cd8-12de7a84b431",
  "videoUrl": "https://marramiau-protube.duckdns.org/media/fa8c041e-35bc-49b4-9cd8-12de7a84b431/video.mp4",
  "thumbnailUrl": "https://marramiau-protube.duckdns.org/media/fa8c041e-35bc-49b4-9cd8-12de7a84b431/thumbnail.webp"
}
```

`app.py` del ZIP:
- Variables `MEDIA_STORAGE_ROOT` (default `/mnt/data/video-platform`), `MEDIA_BASE_URL`, `MEDIA_API_KEY` (mín. 32 caracteres), verificación con `hmac.compare_digest`.
- Límites 100 MiB vídeo, 5 MiB miniatura, no vacíos. Comprueba MIME, formato MP4 y stream de vídeo con ffprobe (timeout 20s). Pillow comprueba formato WEBP y decodificación, límite 20 millones de píxeles.
- Crea staging en `tmp/` (mismo volumen que `videos/`), copia en bloques de 1 MiB, valida ambos archivos, cambia permisos de publicación a 0755 para carpeta y 0644 para archivos, renombra la carpeta completa. Limpia temporales en `finally`. No sobrescribe UUID existentes.
- GET comprueba ambos archivos y evita symlinks directos; DELETE elimina nombres fijos y la carpeta, rechaza symlink de directorio. No borra base de datos.
- No hay gestión de metadatos, catálogo, workspaces, sesiones, usuarios ni comentarios en FastAPI.

`OciMediaClientService` del ZIP utiliza `RestClient` con timeout de conexión 10s y lectura 10 minutos, multipart explícito con MIME correcto y `X-API-Key`. Valida que la respuesta coincida con UUID y URLs esperadas. HTTPS obligatorio para OCI. Traduce errores 413/415/409 y otros fallos a `ResponseStatusException` (gateway 502 en general). `exists` devuelve false en 404, no trata un 409 incompleto como inexistente.

**Autenticación:** Spring sigue haciendo OAuth2/OIDC del usuario. La clave de servicio permite subir/borrar/comprobar archivos también desde herramientas administrativas sin tener una sesión Google. Es un secreto de backend, jamás un header que se envía desde React. El ZIP sustituye el Google ID token del antiguo FastAPI por esta clave; no crea otra tabla de usuarios. Una clave compartida permite acceder al almacenamiento completo: protegerla y no confiarla a terceros. Revisar separación de credenciales/privilegios antes de una producción real si distintos entornos no deben tener acceso mutuo.

## 6. Preparación del dataset y generación de SQL

El usuario quiere un proceso independiente de videoGrabber que relacione los archivos existentes en una carpeta local. La lógica normal de la aplicación nunca debe volver a leer JSON individuales para consultar vídeos o comentarios.

### 6.1. Contrato de entrada

```text
store/
├── 0.json
├── 0.mp4
├── 0.webp
├── 1.json
├── 1.mp4
└── 1.webp
```

Ejemplo ilustrativo compatible con el esquema que manejaba `DevDataLoader` (no corresponde a datos reales facilitados por el usuario):

```json
{
  "id": 0,
  "title": "Vídeo de ejemplo",
  "duration": 40,
  "timestamp": 1760000000,
  "meta": {
    "description": "Descripción del vídeo",
    "categories": ["Gaming"],
    "tags": [],
    "view_count": 1000,
    "like_count": 50,
    "channel": "Example Channel",
    "channel_follower_count": 200,
    "comments": [
      {"text":"Great video!","author":"Example user","timestamp":1760000100,"like_count":5}
    ]
  }
}
```

`prepare_dataset.py` valida que los conjuntos de stems (nombre sin extensión) de los `.json`, `.mp4` y `.webp` coincidan exactamente. Usa el stem, no depende de que `id` numérico del JSON sea la identidad. Requiere título, duración, timestamp y meta.channel; valida tamaños de archivos, valores de contadores, campos de texto obligatorios y fechas de comentarios. Lee JSON UTF-8 con soporte BOM. No recorre subcarpetas.

### 6.2. UUID exactos implementados

Código de `tooling/media/prepare_dataset.py`:

```python
NAMESPACE = UUID("dd90e527-1aa4-46ac-9718-1ba0c470af55")

def uid(*parts):
    return str(uuid5(NAMESPACE, json.dumps(parts, ensure_ascii=False, separators=(",", ":"))))
```

- Vídeo: `uid(dataset, "video", p.stem)`.
- Canal: `uid("channel", channel)` (compartido por nombre, incluso entre versiones de dataset).
- Comentario importado: `uid(video_id, "comment", index)`.

Esto es la implementación real, no la primera fórmula ilustrativa propuesta en el chat. Mantener namespace, serialización de componentes, nombre del dataset y stems para conservar identidad. Si cambia el contenido de un dataset, usar una nueva versión deliberadamente. No reordenar comentarios de un dataset que ya tiene IDs publicados. La identificación de canal por nombre puede fusionar dos canales homónimos; limitación heredada del loader anterior. Si la fuente incorpora identificadores de origen mejores, valorar una migración explícita en lugar de cambiar los UUID sin aviso.

### 6.3. Publicación idempotente

- `--mode local`: copia MP4/WEBP a `media-store/{uuid}/video.mp4` y `thumbnail.webp` por staging/rename. Si ambos archivos existen, los omite; si la carpeta está incompleta, informa de error, no sobrescribe.
- `--mode oci`: GET de existencia con clave, POST solo si GET devuelve 404. Si POST devuelve 409, vuelve a comprobar GET para aceptar una subida concurrente completa. Otros errores se propagan.
- `--mode both`: realiza ambas publicaciones, útil para que el mismo seed pueda usarse en ambos modos.
- No calcula hashes ni actualiza medios existentes. No confundir existencia con integridad de contenido. Si se vuelve a utilizar el mismo dataset ID para archivos distintos, seguirá apuntando a los archivos anteriores.
- Genera SQL después de completar todas las publicaciones solicitadas. Si una publicación falla, puede haber archivos ya subidos, pero se puede volver a ejecutar con los mismos UUID.
- La preparación es una fase administrativa que se ejecuta una vez por versión de datos. Las arrencadas normales solo ejecutan los SQL y no requieren descargar/cargar los MP4 de nuevo.

### 6.4. SQL generado y relaciones

Salida por defecto:

```text
backend/src/main/resources/db/seed/data-h2.sql
backend/src/main/resources/db/seed/data-postgresql.sql
```

Los dos archivos del ZIP original son placeholders con `SELECT 1;`, porque no se recibieron las tripletas reales. Deben regenerarse antes de esperar que aparezcan los vídeos iniciales. No inventar datos del usuario. La prueba de SQL de test sí incluye un pequeño dataset ficticio.

El generador actual produce el mismo contenido SQL para H2 y PostgreSQL, mediante una sintaxis común:

```sql
INSERT INTO video (...)
SELECT ...
WHERE NOT EXISTS (SELECT 1 FROM video WHERE id = CAST('...' AS UUID));
```

Usa casts explícitos UUID y `TIMESTAMP WITH TIME ZONE`, valores booleanos, escape de comillas simples duplicándolas y UTF-8. No utiliza `ON CONFLICT` específico de PostgreSQL ni `MERGE` que pueda actualizar registros. El seeder debe ejecutarse de forma serializada: un `NOT EXISTS` aislado no evita todas las carreras entre dos transacciones concurrentes. Validar que las sentencias y el tratamiento de caracteres especiales son compatibles con los dos motores.

Orden por vídeo (se emiten los canales antes de sus vídeos): `users` → `video` → `video_categories` → `comment`. Se conserva `channel_id` y `video_id` reales; el comentario importado tiene `author_id=NULL`, `author_display_name` original, `parent_id=NULL`, fecha original e `imported_like_count`. El seed no crea likes individuales ni respuestas importadas, ya que el formato actual solo proporciona comentarios raíz y contadores. `view_count` es BIGINT; `like_count` INTEGER; se respetan límites. Categorías se mapean al enum de Java, se deduplican y las desconocidas pasan a `OTHER`. Las filas de categorías y comentarios solo se insertan si el vídeo permanece ACTIVE. No se reactivan vídeos REMOVED ni se reescriben datos existentes.

**No hay importación de tags**: `Tag` solo tiene ID. `channel_follower_count`, dimensiones y otros datos sin campo en la entidad tampoco se guardan. Mantener esta limitación explícita.

### 6.5. Ejecución

Desde la raíz del repo (Windows PowerShell):

```powershell
python -m pip install -r tooling/media/requirements.txt
$env:ENV_PROTUBE_MEDIA_API_KEY = 'REEMPLAZAR_POR_LA_CLAVE_REAL'
python tooling/media/prepare_dataset.py --source 'C:\ruta\store' --dataset initial-v1 --mode both --local-dir './media-store'
```

Opciones reales: `--source` obligatorio, `--dataset` obligatorio, `--mode {local,oci,both}` (default local), `--local-dir`, `--base-url`, `--output`. Solo el modo OCI/both requiere `requests` y clave. Python lee variables del proceso, no el `.env` automáticamente. Configurar esas variables sin guardar secretos en el historial o en Git, según el entorno. `--base-url` usa `ENV_PROTUBE_MEDIA_BASE_URL` o el dominio OCI por defecto. El modo local no depende de OCI ni de SSH. Los compañeros que usan OCI solo requieren los SQL generados y la configuración del servicio, no los ficheros originales.

## 7. Inicio DEV y PROD

### 7.1. DEV: H2 en memoria

No hace falta extraer H2 de la JVM. Spring Boot ejecuta SQL al arrancar, después de la creación de tablas por Hibernate. El YAML preparado conserva conexión, Hikari y consola existentes, y añade:

```yaml
spring:
  flyway:
    enabled: false
  sql:
    init:
      mode: always
      data-locations: classpath:db/seed/data-h2.sql
      encoding: UTF-8
  jpa:
    defer-datasource-initialization: true
    hibernate:
      ddl-auto: update
```

H2 crea el esquema y vuelve a insertar el dataset inicial con los mismos UUID en cada arranque. Las subidas nuevas desaparecen como registros al apagar la JVM, pero sus archivos permanecen en el modo OCI o local. Eso es intencionado hasta que se decida ejecutar limpieza manual; no se introduce un endpoint de sesiones ni un GC automático.

Eliminar `DevDataLoader.java` y su test. No dejar ambos mecanismos de seed activos, ya que producirían vídeos duplicados y referencias inconsistentes.

### 7.2. PROD: PostgreSQL persistente y Docker Compose

El `compose.yaml` del ZIP contiene:

- `db`: `postgres:16`, volumen `postgres_data`, puerto 5432, healthcheck `pg_isready`.
- `db-migrate`: `flyway/flyway:10.10.0`, espera DB healthy; monta `backend/src/main/resources/db/migration` read-only en `/flyway/sql`, ejecuta `migrate`.
- `db-seed`: `postgres:16`, espera que `db-migrate` termine correctamente, monta `db/seed` read-only, ejecuta `psql -v ON_ERROR_STOP=1 --single-transaction -f /seed/data-postgresql.sql`.
- `backend`: perfil Compose `prod`, imagen `maven:3.9-amazoncorretto-21`, espera `db-seed` exitoso, `mvn -Pprod -f pom.xml spring-boot:run`, puerto 8090, conserva los volúmenes de Maven/target/node_modules y monta `ENV_PROTUBE_LOCAL_MEDIA_DIR` en `/media-store`.
- `videograbber`: perfil `tools`, independiente; mantiene `ENV_PROTUBE_STORE_DIR` como su ruta de trabajo. No utilizarlo como requisito para seed.

`application-prod.yaml` mantiene conexión PostgreSQL y `ddl-auto: validate`, con `spring.sql.init.mode: never`. Flyway de Spring sigue habilitado; las migraciones aplicadas por la CLI deberían ser reconocidas sin reaplicarse. Validar versión/checksum y compatibilidad PostgreSQL 16.

Comandos (desde raíz):

```bash
docker compose config
docker compose up db-seed
docker compose --profile prod up backend
# Reejecutar explícitamente con DB existente:
docker compose run --rm db-seed
```

**Discrepancia operativa que Codex debe tener presente:** `docker compose up db` por sí solo NO inicia los servicios que dependen de `db`. El requisito original era hacer seed al iniciar el compose de PostgreSQL. En el paquete se consigue levantando `db-seed` o la app completa, no simplemente `db`. Tampoco `docker compose restart db` garantiza reejecutar los one-shot. Si el usuario necesita que el arranque habitual de solo la DB dispare el seed, definir un comando de arranque documentado o una alternativa explícita antes de cambiar la arquitectura. No ocultar esta diferencia.

No ejecutar `docker compose down -v` en una base persistente que se quiera conservar. No borrar registros ni archivos al arrancar PROD. Un nuevo dataset añade registros, no elimina automáticamente los de versiones anteriores. Para reemplazar un dataset persistente se requiere plan de migración/limpieza.

## 8. Variables y despliegue de OCI

### 8.1. Configuración de Spring

El paquete añade a `application.yaml`:

```yaml
pro_tube:
  auth:
    success-url: ${ENV_PROTUBE_FRONTEND_URL:/}
  media:
    mode: ${ENV_PROTUBE_MEDIA_MODE:local}
    base-url: ${ENV_PROTUBE_MEDIA_BASE_URL:https://marramiau-protube.duckdns.org}
    api-key: ${ENV_PROTUBE_MEDIA_API_KEY:}
    local:
      directory: ${ENV_PROTUBE_LOCAL_MEDIA_DIR:./media-store}
      base-url: ${ENV_PROTUBE_LOCAL_MEDIA_URL:http://localhost:${server.port:8080}}
```

Mantiene `spring.servlet.multipart.max-file-size: 100MB`, `max-request-size: 110MB` y OAuth2 de Google. El límite total permite 100 MiB de vídeo + 5 MiB de miniatura + metadata/overhead habitual. Comprobar límites efectivos si el payload de metadata crece.

Variables `.env.example` del ZIP (solo placeholders):

```dotenv
ENV_PROTUBE_GOOGLE_CLIENT_ID=replace-with-google-client-id
ENV_PROTUBE_GOOGLE_CLIENT_SECRET=replace-with-google-client-secret
# ENV_PROTUBE_FRONTEND_URL=http://localhost:5173/
ENV_PROTUBE_MEDIA_MODE=local
ENV_PROTUBE_MEDIA_BASE_URL=https://marramiau-protube.duckdns.org
ENV_PROTUBE_MEDIA_API_KEY=
ENV_PROTUBE_LOCAL_MEDIA_DIR=./media-store
# ENV_PROTUBE_LOCAL_MEDIA_URL=http://localhost:8080
ENV_PROTUBE_STORE_DIR=./store
ENV_PROTUBE_DB_USER=protube
ENV_PROTUBE_DB_PASS=replace-with-a-local-password
ENV_PROTUBE_DB=protube
ENV_PROTUBE_DB_HOST=db
```

Para trabajar en OCI, `ENV_PROTUBE_MEDIA_MODE=oci` y rellenar clave. En IntelliJ conviene ruta absoluta de `ENV_PROTUBE_LOCAL_MEDIA_DIR`; la configuración `.run/Dev (H2).run.xml` observada ya carga `$PROJECT_DIR$/.env`. Si la app arranca fuera de Compose, usar DB host adecuado (normalmente localhost cuando conecta al puerto expuesto); `db` resuelve dentro de la red Compose. No modificar el `.env` real al aplicar el paquete.

### 8.2. Despliegue en OCI (solo con autorización)

1. Coordinar cambio de contrato con el equipo. Hacer copia del `app.py` instalado y configuración del servicio. Inventariar archivos existentes y referencias persistentes antes de tocar nada.
2. Copiar `tooling/media/oci/app.py`, `requirements.txt`, `clear_media.py` y `media.env.example` a `/opt/protube-media/`. Si se necesita SSH, usar la clave local existente, nunca incluirla en Git.
3. Verificar instalación de `ffprobe`, directorios y permisos. El nuevo servidor necesita FastAPI, uvicorn, python-multipart y Pillow (rangos fijados en `requirements.txt`). No necesita Google Auth para el nuevo contrato.

```bash
cd /opt/protube-media
# Reutilizar un venv válido existente o crear uno si no hay:
python3 -m venv .venv
.venv/bin/pip install -r requirements.txt
# Generar una clave de servicio aleatoria; almacenarla de forma segura:
python3 -c 'import secrets; print(secrets.token_hex(32))'
```

Variables del servidor (archivo de entorno protegido o configuración de systemd):

```dotenv
MEDIA_BASE_URL=https://marramiau-protube.duckdns.org
MEDIA_STORAGE_ROOT=/mnt/data/video-platform
MEDIA_API_KEY=REEMPLAZAR_POR_SECRETO_ALEATORIO
```

La misma clave va en el backend como `ENV_PROTUBE_MEDIA_API_KEY`. No enviar al frontend. Usar fichero de secretos con permisos 600 si corresponde. Verificar usuario de servicio y lectura de Nginx sobre los archivos publicados. `videos/` y `tmp/` deben compartir filesystem para renombrado de staging.

Identificar servicio real antes de reiniciar:

```bash
systemctl list-units --type=service | grep -Ei 'protube|uvicorn'
systemctl cat NOMBRE_REAL_DEL_SERVICIO
```

Conservar la configuración efectiva del proceso, actualizar EnvironmentFile y reiniciar el servicio correcto. Si se arranca manualmente solo para prueba, sin otro proceso ocupando el puerto:

```bash
cd /opt/protube-media
set -a
source ./media.env
set +a
.venv/bin/uvicorn app:app --host 127.0.0.1 --port 8001
```

Comprobación pública no destructiva:

```bash
curl https://marramiau-protube.duckdns.org/api/health
```

Después probar upload, lectura de vídeo y miniatura, GET de existencia y DELETE con un UUID de prueba, usando la clave de forma segura. No utilizar un UUID de datos reales. Verificar que no hay acceso a archivos de staging desde Nginx y que no se ha interrumpido reproducción de URLs antiguas. No se ha hecho este despliegue real hasta la fecha de corte.

## 9. Limpieza administrativa manual

El archivo `tooling/media/oci/clear_media.py` funciona directamente sobre el filesystem en OCI. Usa `MEDIA_STORAGE_ROOT` o `/mnt/data/video-platform`. No llama a Spring y no lee ninguna BBDD. Por defecto es un dry run; solo borra con `--confirm`.

```bash
cd /opt/protube-media
python3 clear_media.py --all                         # muestra candidatos
python3 clear_media.py --video-id UUID_REAL          # muestra un candidato
python3 clear_media.py --video-id UUID_REAL --confirm
# RESET TOTAL, solo tras revisar referencias y copias de seguridad:
python3 clear_media.py --all --confirm
```

`--video-id` se puede repetir. `--all` considera los directorios de nombre UUID y archivos planos `.mp4`/`.webp` heredados. Elimina los dos nombres esperados dentro de una carpeta y luego la carpeta; no es un `rm -rf` indiscriminado. Evita symlinks directos. No gestiona archivos desconocidos, temporales antiguos ni realiza detección automática de huérfanos. Una carpeta con otros archivos puede impedir `rmdir` tras borrar parte de su contenido: revisar el comportamiento antes de reset real.

**Precauciones:** el script no protege automáticamente IDs de PostgreSQL, ni del dataset, ni de otros H2 activos. `--all --confirm` rompe URLs referenciadas si se usa sin coordinación. Detener subidas durante reset global, realizar backup y revisar los UUID activos/pendientes y referencias en todos los entornos relevantes. Un archivo no referenciado por tu H2 no necesariamente está huérfano. No convertir este script en cron ni en lógica de arranque. Los datos de PostgreSQL siguen existiendo después del script. El usuario quiere limpieza manual, no automatizada. Si se desea un modo de reconciliación/allowlist seguro, es una mejora futura y requiere decidir qué bases son fuentes de referencias.

## 10. Pruebas de API y diagnóstico Postman

En la conversación original se solucionaron errores 415 al usar el contrato multipart con DTO directo. No volver a convertir metadata manualmente a String/Jackson.

### 10.1. Subida desde Spring

URL en DEV: `POST http://localhost:8080/api/videos/upload`.

Iniciar sesión en el navegador con Google OAuth2, copiar de forma privada la cookie `JSESSIONID` del host localhost al cookie jar de Postman. No usar un Bearer inventado; Spring autentica la sesión. No compartir cookie ni ponerla en el repo. Si se reinicia H2/app, iniciar sesión de nuevo cuando corresponda.

En Body → form-data:

| Key | Type | Content-Type |
|---|---|---|
| `metadata` | Text | `application/json` |
| `file` | File | `video/mp4` |
| `thumbnail` | File | `image/webp` |

JSON de ejemplo para el contrato nuevo:

```json
{
  "title": "Vídeo de prueba",
  "duration": 10,
  "meta": {
    "description": "Prueba de subida",
    "categories": ["Gaming"],
    "tags": [],
    "view_count": 0,
    "like_count": 0,
    "channel": "",
    "channel_follower_count": 0
  }
}
```

No fijar manualmente Content-Type global: Postman genera `multipart/form-data; boundary=...`. La parte metadata debe tener `application/json`, no `text/plain` ni `application/octet-stream`. Desde frontend enviar metadata como `Blob([JSON.stringify(metadata)], {type:'application/json'})`, más file y thumbnail; enviar cookies (`credentials: 'include'` o Axios `withCredentials: true`) y dejar que el navegador genere el boundary.

Histórico de diagnóstico: el primer 415 con `multipart/form-data;boundary=...;charset=UTF-8` correspondía probablemente al controlador antiguo con `@RequestBody` JSON. Tras cambiar a `@RequestPart`, el 415 de `application/octet-stream` indicaba que la parte metadata no estaba correctamente tipada. El usuario lo resolvió sin cambiar el DTO. Se mantiene ese contrato.

### 10.2. Criterios de aceptación

- Upload autenticado devuelve 201; DTO contiene ID, videoUrl y thumbnail. UUID coincide con carpeta y ambas URLs. Registro ACTIVE y relaciones correctas en DB.
- GET listado/detalle/search solo devuelve vídeos ACTIVE. `GET /api/videos/{id}/comments` devuelve comentarios ligados al UUID correspondiente, sin duplicarlos al reseed.
- URL de vídeo devuelve 200 y un Range válido permite 206; miniatura WEBP se visualiza. Reproductor puede buscar dentro del MP4. Verificar también frontend.
- Upload sin sesión no debe tener éxito; MIME inválido o tamaño excesivo rechazado; no publicar una pareja incompleta.
- DELETE ajeno devuelve 404 según búsqueda por propietario; DELETE propio devuelve 204 y el vídeo queda REMOVED. Repetir DELETE no provoca error por archivo ausente. Probar fallo simulado de OCI y reintento.
- Arranque DEV dos veces: dataset reaparece con mismos IDs y relaciones; archivos no se vuelven a subir; los nuevos registros de H2 desaparecen al reiniciar sin borrar OCI.
- Arranque/reseed PROD dos veces: no se duplican ni sobrescriben registros, comentarios y categorías. Los vídeos subidos después del seed siguen presentes. Ninguna limpieza automática.
- Cambiar modo LOCAL/OCI antes de arrancar: seed resuelve URLs correspondientes, siempre que ambos almacenes hayan sido preparados. No requiere clave OCI en LOCAL; no migra contenido histórico de nuevas subidas. No eliminar medios pertenecientes a otro modo.

## 11. Inventario exacto de cambios del ZIP

Referencia: `protube-local-oci.zip`, 25/11/2026. 31 archivos regulares contando la lista de eliminación (el listado ZIP incluye también entradas de directorio). Se superpone a la raíz, no es un proyecto completo. Se conserva `pom.xml`, las cuatro migraciones existentes, `Video.java`, `VideoRepository`, `UserRepository`, `Comment`/`CommentService`/`CommentController`, `PublicVideoResponseDTO` y frontend.

### Crear

```text
backend/src/main/java/com/tecnocampus/LS2/protube_back/configuration/LocalMediaConfig.java
backend/src/main/java/com/tecnocampus/LS2/protube_back/services/media/MediaStorageStrategy.java
backend/src/main/java/com/tecnocampus/LS2/protube_back/services/media/MediaStorageContext.java
backend/src/main/java/com/tecnocampus/LS2/protube_back/services/media/LocalMediaStorage.java
backend/src/main/resources/db/seed/data-h2.sql
backend/src/main/resources/db/seed/data-postgresql.sql
backend/src/test/java/com/tecnocampus/LS2/protube_back/services/media/MediaStorageContextTest.java
backend/src/test/java/com/tecnocampus/LS2/protube_back/SeedSqlTest.java
backend/src/test/resources/seed-test.sql
tooling/media/prepare_dataset.py
tooling/media/requirements.txt
tooling/media/smoke_test.py
tooling/media/README.md
tooling/media/oci/app.py
tooling/media/oci/clear_media.py
tooling/media/oci/requirements.txt
tooling/media/oci/media.env.example
```

### Modificar

```text
backend/src/main/java/com/tecnocampus/LS2/protube_back/controller/VideosController.java
backend/src/main/java/com/tecnocampus/LS2/protube_back/model/dto/RequestDTO/CreateVideoRequestDTO.java
backend/src/main/java/com/tecnocampus/LS2/protube_back/security/SecurityConfig.java
backend/src/main/java/com/tecnocampus/LS2/protube_back/services/VideoService.java
backend/src/main/java/com/tecnocampus/LS2/protube_back/services/OciMediaClientService.java
backend/src/main/resources/application.yaml
backend/src/main/resources/application-dev.yaml
backend/src/main/resources/application-prod.yaml
backend/src/test/java/com/tecnocampus/LS2/protube_back/controller/VideosControllerTest.java
backend/src/test/java/com/tecnocampus/LS2/protube_back/services/VideoServiceTest.java
backend/src/test/java/com/tecnocampus/LS2/protube_back/services/OciMediaClientServiceTest.java
.env.example
compose.yaml
```

### Eliminar (según `DELETE_FILES.txt` del ZIP)

```text
backend/src/main/java/com/tecnocampus/LS2/protube_back/DevDataLoader.java
backend/src/test/java/com/tecnocampus/LS2/protube_back/DevDataLoaderTest.java
```

`DELETE_FILES.txt` se usa como instrucción auxiliar, no tiene que quedar en el repositorio final. No borrar `VideoMetadataRequestDTO`. Añadir `media-store/` al `.gitignore` existente (la guía lo solicita; el ZIP no modifica `.gitignore`). Verificar referencias residuales a `pro_tube.store`, `load_initial_data`, `ENV_PROTUBE_STORE_DIR` en archivos `.run`, docs, tests y tooling; no borrar la variable que usa videoGrabber. No es necesario introducir dependencias Java. El POM revisado todavía contenía `sshj` y Gson de etapas previas: solo considerar su retirada si no tienen otros consumidores.

## 12. Estado de validación y riesgos pendientes

### 12.1. Lo que se ha comprobado

- Se revisó el árbol y los archivos del backend de la rama indicada antes de generar la propuesta.
- El ZIP y su README fueron preparados y sus contenidos inspeccionados nuevamente para este traspaso.
- Según la comprobación comunicada en la conversación, se ejecutó el smoke test Python local con FastAPI TestClient, ffmpeg/ffprobe y Pillow. Se usó un MP4 y WEBP generados para la prueba, no archivos del usuario. Validó: UUID determinista, escape de comillas SQL, generación de los dos SQL, copia local y salto de duplicado, salud, 401 sin clave, 404 antes de subir, POST 201, GET 200, conflicto 409 por UUID existente y DELETE idempotente (204 dos veces, GET 404 final).
- El test reproducible está incluido en `tooling/media/smoke_test.py`. No se ha vuelto a ejecutar al escribir este contexto; el resultado histórico no equivale a una prueba nueva ni prueba SQL contra un motor real.

Reproducir con un entorno Python adecuado:

```bash
python -m pip install -r tooling/media/oci/requirements.txt httpx
python tooling/media/smoke_test.py
```

Requiere ffmpeg y ffprobe en PATH. La prueba crea un directorio temporal y un servidor TestClient, no contacta OCI. No se han ejecutado operaciones destructivas reales.

### 12.2. No verificado todavía

- Compilación y ejecución Maven con Java 21; tests unitarios/integración y cobertura CI.
- Compatibilidad real de los INSERT generados con esquema Hibernate H2 y migraciones Flyway PostgreSQL. `SeedSqlTest` prepara una fixture y comprueba dos ejecuciones y relaciones, pero queda por ejecutarlo. Revisar si `DataJpaTest` existentes necesitan `spring.sql.init.mode=never` para aislar sus fixtures cuando se rellene el SQL de producción.
- `docker compose config`, `db-migrate`, `db-seed` y backend en contenedores reales, incluyendo perfil Maven/Spring correcto.
- Despliegue real del nuevo FastAPI, permisos de filesystem, systemd, Nginx y conectividad. No se han cambiado archivos del servidor, hecho push ni editado la DB real.
- Dataset real de usuario: no se han recibido los JSON/MP4/WEBP, por lo que no se han generado los INSERT definitivos ni subido vídeos iniciales reales.
- Integración frontend de la subida con nueva parte thumbnail y comentarios; el ZIP no incluye cambios frontend. Leer la versión actual antes de implementar.

### 12.3. Puntos de revisión técnica para Codex

1. **Compatibilidad del contrato:** desplegar API y backend de forma coordinada. URLs antiguas planas e IDs distintos no se migran automáticamente. Si hay vídeos referenciados en PG, conservarlos o planificar migración explícita antes del reset.
2. **Propiedad y clave de servicio:** Spring autoriza DELETE según el usuario; FastAPI confía en cualquier cliente con la clave de servicio. No entregar esa clave a usuarios finales. Para producción real, evaluar separación de privilegios, limitación de tasa y rotación; evitar que desarrolladores puedan afectar medios de producción. La decisión actual es sin workspaces y sin limpieza automática, no un aislamiento de seguridad fuerte.
3. **Consistencia remota:** no existe transacción distribuida. Auditar filas PENDING/REMOVED y huérfanos cuando haya crash, timeout o respuesta inesperada. Si falla DELETE tras confirmar REMOVED, se debe poder reintentar. Considerar reintentos controlados y mejor distinción de resultados inciertos si es necesario.
4. **Semántica de seed:** no reescribe datos existentes. `NOT EXISTS` requiere ejecución serializada; no asumir idempotencia concurrente. Proteger datos reales. Validar el uso de SQL para contenidos con comillas, punto y coma, unicode y saltos de línea contra H2 y psql. Considerar comentarios añadidos/eliminados por usuarios y cambios de dataset sin reactivar vídeos REMOVED.
5. **Modo local:** valida MIME y tamaño desde VideoService y copia archivos, pero no decodifica completamente MP4/WEBP como hace OCI. El script de preparación local comprueba tamaños, no el contenido. Si se usa en producción, añadir validación real. Revisar si los directorios `.upload-*` dentro de la raíz local pueden quedar accesibles temporalmente mediante el resource handler, y evitar publicar staging/archivos inesperados. Revisar symlinks, carreras upload/delete y permisos.
6. **Configuración de URL:** valores default local/OCI y puertos distintos DEV/PROD. Las rutas relativas del seed cambian con Strategy y las absolutas de nuevas subidas no. Revisar frontend `MEDIA_BASE_URL` y resolución de miniaturas, no concatenar doble `/media`. Si se cambia hostname/puerto, la validación estricta de DELETE por URL puede rechazar medios legítimos; diseñar migración o identidad de almacenamiento explícita si surge el requisito.
7. **Seguridad Spring:** CSRF sigue desactivado y H2 console permitAll en el código actual. Revisar protección CSRF para sesiones con cookies y restricciones de consola al perfil DEV antes de producción, coordinando frontend. No cambiar de forma silenciosa el mecanismo de login.
8. **Nginx:** comprobar Range, tipos MIME, caché y tamaños efectivos, verificar expiración/renovación TLS. FastAPI está detrás de loopback; no necesita exponer 8001. Considerar límites del parser multipart y uso de temporales para cargas maliciosas.
9. **Migraciones:** V4 podría fallar en PostgreSQL antiguo con comentarios existentes al añadir NOT NULL sin backfill. No editar Flyway ya aplicado. Si se necesita compatibilidad, diseñar nueva migración o estrategia de actualización de la base existente tras inspección.
10. **Arranque de DB:** aclarar que `up db-seed` (o backend) ejecuta seed, `up db` solo no lo hace. Asegurar que la documentación y los comandos de ejecución del equipo reflejan esta diferencia y que los tests no dependan de un dataset real.
11. **Scripts y permisos:** no subir contenido multimedia, claves ni datos que no deban compartirse al repositorio. Validar que los medios y metadata de origen se pueden usar en el proyecto. No generar SQL ficticio para reemplazar el dataset real.
12. **Etiquetas y comentarios:** tags se omiten por modelo incompleto. Mantener el sistema de comentarios existente y comprobar el endpoint de GET público, autenticación para escrituras y relación correcta mediante `video_id`. No añadir autores Google ficticios para comentar.

## 13. Próximos pasos recomendados

Orden propuesto, no tareas ya ejecutadas:

- [ ] Abrir el checkout real en Codex, confirmar rama y estado (`git status`, `git branch --show-current`, `git log -1`, diff con develop) sin perder cambios no committeados.
- [ ] Revisar `AGENTS.md` y el ZIP/README; comparar las versiones de los archivos. Si el usuario ya los copió, no duplicar ni sobrescribir cambios nuevos.
- [ ] Aplicar cambios restantes del paquete y eliminar loader y test antiguos. Añadir ignore de archivos multimedia. Mantener las migraciones previas intactas.
- [ ] Revisar el código preparado y resolver errores de compilación con Java 21/Maven. Ejecutar tests DEV con credenciales OAuth de test o entorno configurado sin registrarlas en archivos versionados.
- [ ] Ejecutar smoke Python y pruebas SQL reales H2/PG con una fixture controlada, repetir seed y comprobar claves foráneas, idempotencia, títulos/comentarios Unicode y estado REMOVED.
- [ ] Validar Compose con PostgreSQL de prueba. No utilizar DB ni volumen real para operaciones destructivas. Acordar comando de arranque habitual (`db-seed` o backend).
- [ ] Probar modo LOCAL end-to-end con una tripleta de prueba. Verificar GET/POST/DELETE, propietario, rutas y comentarios.
- [ ] Coordinar y desplegar FastAPI nuevo a OCI con backup, servicio y clave segura, solo tras autorización. Verificar health y prueba con UUID aislado, no borrar medios previos.
- [ ] Ejecutar `prepare_dataset.py` con la carpeta real de tripletas, dataset ID estable y modo deseado (both si se necesitan las dos estrategias). Distribuir SQL generado a quienes deban utilizarlo.
- [ ] Probar arranque DEV dos veces; verificar que el dataset reaparece con IDs estáticos, no se retransfieren archivos y los comentarios corresponden al vídeo.
- [ ] Probar PROD (con DB de prueba primero): seed no duplicado y nuevas subidas persistentes tras reinicio; verificar reproducción en OCI, miniaturas, borrado y reintentos.
- [ ] Adaptar frontend si necesita nueva parte thumbnail o mostrar comentarios (no reescribir componentes ajenos sin necesidad).
- [ ] Inventariar vídeos antiguos y huérfanos, establecer procedimiento manual de limpieza seguro. No ejecutar `--all --confirm` hasta que el usuario autorice y se revisen referencias/backups.
- [ ] Actualizar documentación del repo y preparar commits/PR según convenciones del equipo. Reportar pruebas pendientes y límites reales.

## 14. Prompt inicial para Codex

> Lee CONTEXT.md y AGENTS.md de este repositorio. CONTEXT.md resume los acuerdos técnicos y el paquete protube-local-oci.zip preparado en ChatGPT. Inspecciona el checkout actual de PTB-43-tech-debt-reengineering-on-video-gathering-front-to-back; distingue código existente, cambios del ZIP y trabajo pendiente. No des por hecho que los archivos del ZIP están aplicados o que FastAPI está desplegado. Quiero continuar la implementación sin introducir infraestructura innecesaria: Strategy LOCAL/OCI con MediaStorageContext (sin @ConditionalOnProperty ni Factory adicional), UUID compartido, MP4/WEBP juntos, seeder Python desde tripletas locales que genere SQL idempotente, H2 in-memory y PostgreSQL persistente, comentarios existentes y limpieza manual. Conserva la autenticación Google en Spring y usa clave privada de servicio para FastAPI. No añadas catálogo, workspaces ni sesiones OCI. Antes de modificar, compara los archivos y revisa riesgos y tests. Aplica solo los cambios necesarios y valida el resultado; no hagas push, despliegues, borrados de datos ni resets sin mi autorización. Explica qué has probado y qué queda pendiente.

## 15. Fuentes y archivos de referencia

- Conversación ChatGPT hasta el 25/11/2026: requisitos del usuario, configuración de OCI aportada, decisiones y propuestas descartadas.
- Revisión GitHub de la rama PTB-43, árbol `992c9be449d2d3a539ea5d6b06574c64b1c4bb8d`.
- Paquete `protube-local-oci.zip` preparado el 25/11/2026. Sus archivos se inspeccionaron directamente para este documento. La guía técnica original se encuentra en `tooling/media/README.md`; léela además de este contexto para instrucciones de aplicación y despliegue.
- `DELETE_FILES.txt` del paquete: lista explícita de los dos archivos a eliminar.

**Recomendación de traspaso:** guardar `CONTEXT.md` en la raíz del checkout y tener el ZIP a mano (o extraerlo en una carpeta temporal fuera del repo). Codex no tiene acceso automático al historial de esta conversación ni debe presumir que puede acceder a archivos adjuntos de ChatGPT. El código real del checkout y los archivos del paquete, una vez facilitados a Codex, prevalecen sobre este resumen si difieren. No es necesario versionar este documento ni el ZIP; se pueden conservar localmente para el trabajo de traspaso.
