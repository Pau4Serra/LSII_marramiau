# Almacenamiento multimedia Spring / OCI

## Estado de esta fase

Spring selecciona LOCAL u OCI mediante `MediaStorageContext` al arrancar, con
independencia del perfil de BBDD `dev` (H2) o `prod` (PostgreSQL).
Se mantienen Google OIDC y la sesión `JSESSIONID`. No hay un JWT nuevo.

En OCI se ha probado manualmente la API nueva en el puerto interno 8002:
subida MP4+WEBP, existencia, conflicto, HTTPS/MIME/Range y DELETE idempotente.
El servicio público en 8001 **sigue usando el contrato antiguo**. No activar
Spring en OCI hasta coordinar ese cambio. El servicio 8002 es temporal.

`prepare_dataset.py` ya prepara las tripletas y genera los SQL. Falta ejecutarlo
con el dataset real y configurar la ejecución del seed al arrancar H2/Compose.
Se han retirado `DevDataLoader` y el servidor plano `MvcConfig`: H2 empieza sin
vídeos iniciales hasta completar esa configuración. No se han borrado archivos
de origen ni datos de PostgreSQL.
Tampoco se ha adaptado la UI de subida del frontend.

## Configuración

Copiar los placeholders de `.env.example` al entorno habitual sin versionar
secretos. Spring no carga `.env` por sí solo: lo debe cargar el IDE/Compose o
el proceso que lo ejecuta. No se modifica el `.env` real con estos cambios.

- `ENV_PROTUBE_MEDIA_MODE=local` (default) o `oci`.
- `ENV_PROTUBE_LOCAL_MEDIA_DIR`: carpeta de nuevas subidas (default
  `./media-store`, relativa al directorio de trabajo; recomendable ruta absoluta
  en el IDE). No es la carpeta de tripletas del dataset antiguo.
- `ENV_PROTUBE_LOCAL_MEDIA_URL`: origen público local, **sin `/media`**;
  por defecto localhost:8080 en DEV o localhost:8090 en PROD.
- `ENV_PROTUBE_MEDIA_BASE_URL`: origen HTTPS de OCI, sin `/media` ni `/api`.
- `ENV_PROTUBE_MEDIA_API_KEY`: secreto de servicio, solo necesario para operar
  en OCI. Debe coincidir con `MEDIA_API_KEY` del servidor; nunca enviarlo a React.

El modo LOCAL arranca sin clave OCI y no contacta con el servidor remoto.
Compose pasa las variables al backend y monta el directorio local en
`/media-store`; se conservan los volúmenes y datos existentes.

### Catálogo inicial

Spring ya no lee JSON individuales ni utiliza `ENV_PROTUBE_STORE_DIR` o
`ENV_PROTUBE_DEV_MEDIA_BASE_URL`. Se conserva `ENV_PROTUBE_STORE_DIR` únicamente
para la herramienta opcional videoGrabber. El script de preparación transforma
las tripletas locales en el layout UUID y genera el seed SQL.

## Preparar el dataset una vez

Requiere Python 3.10+. Es independiente de videoGrabber y de Spring: no hace
login Google, no lee BBDD y no ejecuta SQL. Trabaja sobre una carpeta existente
con `.json`, `.mp4` y `.webp` de nombres coincidentes (`0.json`, `0.mp4`, `0.webp`,
etc.). No recorre subcarpetas ni modifica los originales. Antes de publicar
valida todas las tripletas y sus metadatos.

Desde la raíz del repositorio, ejemplo LOCAL (no necesita paquetes externos):

```powershell
python tooling/media/prepare_dataset.py --source 'C:\ruta\store' --dataset initial-v1 --mode local --local-dir 'C:\ruta\media-store'
```

Usar el mismo directorio absoluto en `ENV_PROTUBE_LOCAL_MEDIA_DIR` de Spring.
El comando es ilustrativo: reemplazar las rutas por las reales antes de ejecutarlo.
Si el equipo no tiene Python, puede ejecutarse en un contenedor con los montajes
de origen/destino adecuados; no es necesario instalar nada nuevo en OCI para LOCAL.

Opciones:

- `--source`: carpeta obligatoria de tripletas.
- `--dataset`: identificador/versionado obligatorio. **No cambiarlo ni renombrar
  los archivos** si se quieren conservar los UUID. Un cambio de contenidos que
  deba publicarse como otro dataset necesita una versión nueva deliberada.
- `--mode local|oci|both`: default LOCAL. `both` prepara ambos almacenes.
- `--local-dir`: default `./media-store`, relativo al directorio de ejecución.
- `--base-url`: origen HTTPS de OCI, default `ENV_PROTUBE_MEDIA_BASE_URL` o el
  dominio OCI. No admite rutas, credenciales ni redirecciones HTTP.
- `--output`: carpeta SQL de salida. Default
  `backend/src/main/resources/db/seed` del repositorio.

Solo OCI/both requiere instalar `tooling/media/requirements.txt` y disponer de
`ENV_PROTUBE_MEDIA_API_KEY` en el proceso. No lee `.env` automáticamente. No pasar
la clave por argumentos, guardarla en Git ni mostrarla en logs. El endpoint OCI
público antiguo no es compatible: completar el cambio coordinado antes de usar
esos modos. No exponer el puerto temporal 8002 para ejecutar el seeder.

### Qué genera y qué omite

- UUID v5 con namespace `dd90e527-1aa4-46ac-9718-1ba0c470af55` y componentes JSON
  UTF-8 compactos: vídeo `(dataset, "video", stem)`, canal `("channel", nombre)`
  y comentario `(video_id, "comment", índice)`. El `id` del JSON no se usa.
  Canales homónimos se agrupan; no reordenar comentarios de un dataset publicado.
- MP4 y WEBP con el mismo UUID. LOCAL copia mediante staging; OCI consulta GET
  y sube ambos archivos solo si devuelve 404. Una pareja incompleta es un error.
- `data-h2.sql` y `data-postgresql.sql`, UTF-8 con contenido común compatible con
  ambos motores. Incluyen canales sintéticos no autenticables, vídeos ACTIVE,
  categorías y comentarios raíz con autor visible, fecha y likes importados.
  Las URLs son relativas `/media/{uuid}/...`, resueltas por la Strategy activa.
- No importa tags (el modelo no tiene nombre), seguidores, respuestas ni likes
  individuales. Las categorías desconocidas se convierten en OTHER.

Los archivos completos existentes se omiten **sin calcular hashes ni actualizar
su contenido**. El SQL se escribe solo después de completar todas las
publicaciones solicitadas. Si falla una publicación, puede haber archivos ya
copiados/subidos; repetir con el mismo dataset permite continuar sin sobrescribirlos.

El SQL añade filas ausentes sin actualizar las existentes ni reactivar vídeos
REMOVED. Sus categorías/comentarios solo se añaden si el vídeo está ACTIVE.
Ejecutarlo después del esquema/migraciones y de forma serializada: `NOT EXISTS`
no protege contra dos seeders concurrentes. No elimina versiones anteriores.
Las pruebas ficticias están solo en `src/test/resources/seed-test.sql`; no hay
SQL de producción inventado. La ejecución automática al arrancar sigue pendiente.

### Pruebas del preparador

`test_prepare_dataset.py` usa datos ficticios y OCI simulado. Desde este directorio:

```bash
python -m pip install -r requirements.txt pytest pytest-cov
python -m pytest test_prepare_dataset.py --cov=prepare_dataset --cov-fail-under=80
```

La fixture SQL está generada por el mismo código y el test comprueba que coincide.
`SeedSqlTest` la ejecuta dos veces contra el esquema real Hibernate/H2 y verifica
relaciones, caracteres especiales y REMOVED. También se ha ejecutado la fixture
en un PostgreSQL 16 temporal tras aplicar V1–V4, sin tocar la DB existente.
LOCAL valida tamaño y metadatos, no decodifica el contenido multimedia; OCI sí lo
valida con ffprobe/Pillow. Falta probar el dataset real y el preparador contra OCI real.

## Contrato de Spring

`POST /api/videos/upload`, con sesión Google válida, multipart:

- `metadata`: JSON con `Content-Type: application/json`, deserializado como DTO.
  Campos `title`, `duration` (segundos, entero positivo) y `meta`.
- `file`: MP4, MIME `video/mp4`, hasta 100 MiB.
- `thumbnail`: WEBP, MIME `image/webp`, hasta 5 MiB.

El campo String `thumbnail` ya no pertenece al DTO de entrada. Categorías y
descripción se toman de metadata; identidad de canal y contadores son del
servidor. No se confía en el canal/likes/views del cliente. No se importan tags
porque el modelo actual no dispone de nombre.

Desde React: metadata como `Blob` application/json, ambos archivos y cookies;
no fijar el Content-Type global (el navegador genera el boundary).

`Video` genera su UUID con `UUID.randomUUID()` al construirse, sin
`@GeneratedValue`. Spring prepara el modelo completo, sube ambos archivos usando
ese UUID y solo entonces lo guarda como ACTIVE mediante `saveAndFlush`.
No se reserva una fila PENDING ni se usa `TransactionTemplate`.

Si falla la subida, no se guarda el vídeo. Si la subida se confirma pero falla el
guardado, se intenta borrar esa pareja multimedia y se conserva el error
original. Una caída entre subida y guardado, un resultado remoto incierto o un
fallo de compensación pueden dejar archivos huérfanos sin fila en BBDD: revisión
manual. Las transacciones normales del repositorio siguen siendo las de Spring
Data JPA; no se mantiene una transacción abierta durante la transferencia.

`DELETE /api/videos/{uuid}` devuelve 204 para el propietario. Un ID ajeno devuelve
404. Guarda REMOVED con `saveAndFlush` antes de borrar los archivos; ante fallo remoto admite
reintentar. No borra comentarios de la BBDD. PENDING, URLs antiguas o medios de
otra ubicación se rechazan con 409 para evitar borrar en el almacén incorrecto.

El DTO público conserva su formato. Las rutas `/media/...` del futuro seed se
resuelven contra la estrategia; las URLs absolutas históricas se mantienen.
Cambiar de modo no migra archivos ni hace borrables los de otra ubicación.

## Archivos locales

Parejas en `{directory}/{uuid}/video.mp4` y `thumbnail.webp`. Se copian ambos
archivos a una carpeta temporal `.upload-*` y luego se renombra la carpeta a su
destino. La temporal está en el mismo directorio/volumen para permitir el
renombrado atómico, también cuando Docker monta esa carpeta como volumen.

`LocalMediaConfig` solo registra las dos rutas con nombres de carpeta de 36
caracteres hexadecimales/guiones, utilizando el servidor de recursos estándar de
Spring (incluye HEAD/Range). Ese patrón excluye `.upload-*` sin un resolutor
propio; la aplicación genera UUID canónicos. No se sirven JSON ni otros nombres.
El árbol publicado es de confianza: no colocar secretos ni symlinks dentro de él. Las
operaciones de almacenamiento conservan la comprobación de symlinks directos y
de contenido inesperado antes de borrar. No hay borrados recursivos.

La estrategia local sincroniza operaciones dentro de una sola JVM; no compartir
el directorio entre varios procesos escritores. Solo usuarios de confianza
deben poder escribir en su árbol. Valida tamaños/MIME en Spring, pero no
decodifica completamente los medios como ffprobe/Pillow en OCI. No hay limpieza
automática al reiniciar H2. Mantener archivos fuera de Git.

Para configuración y operaciones OCI, ver [oci/README.md](oci/README.md).

## Validación actual (25/11/2026)

Preparador: **40 pruebas Python correctas, 98,46 % de cobertura**, en Linux con
fuentes montadas en solo lectura y salidas temporales. SQL generado validado en
H2 y PostgreSQL 16 (migraciones V1–V4), incluidas dos ejecuciones, relaciones,
Unicode/comillas/saltos de línea y preservación de REMOVED. Maven `verify` tras
añadir `SeedSqlTest`: 97 pruebas detectadas, 95 correctas y dos omitidas por
privilegios de symlinks en Windows. Sin errores y con controles de cobertura OK.
No se ha utilizado la carpeta real del usuario ni contactado OCI desde el script.

Tras retirar la gestión manual de transacciones: Maven `clean verify` con Java
21 en Windows, 95 pruebas detectadas (93 correctas y dos omitidas por privilegios
de symlinks), sin errores. Cobertura de líneas: **97,46 %**. La integración H2
comprueba que no se guarda una fila antes del upload, que el UUID se conserva y
que un fallo real de integridad en BBDD provoca compensación sin dejar vídeo.
La baja REMOVED sigue persistida aunque falle el borrado remoto y permite reintento.
No se ha repetido Linux tras este último cambio de persistencia.

## Validación anterior a la simplificación

- Maven `verify` con Java 21 en Windows: 106 pruebas, sin errores, dos omitidas
  por falta de privilegios para crear symlinks.
- Maven `verify -Djacoco.append=false` en copia aislada Linux/Java 21:
  **106 pruebas correctas, ninguna omitida**, cobertura de líneas 97,33 %.
  Se incluyen persistencia real H2, compensación, comprobación de
  propietario, multipart HTTP, delegación Strategy, Range/CORS y symlinks.
- `docker compose config --quiet`: correcto; conserva el aviso preexistente
  sobre el atributo Compose `version` obsoleto.

Las pruebas Spring de OCI usan un servidor HTTP simulado; no se han usado claves
reales ni contactado la VM desde Maven. Falta verificar subida autenticada con
sesión Google desde el IDE y la integración Spring↔OCI tras el cambio coordinado.
No se ha probado el arranque PROD/PostgreSQL ni realizado cambios remotos en esta
fase de Spring. No confundir estas comprobaciones locales con CI del repositorio.
