# API multimedia OCI

Implementación para la VM **Linux** existente. No despliega Spring, no tiene BBDD
ni catálogo y no valida usuarios Google: Spring autoriza al usuario y envía una
clave de servicio privada. **No enviar esta clave a React.**

Este código todavía no implica un despliegue ni una prueba contra OCI. El ZIP
mencionado en `CONTEXT.md` no estaba disponible al preparar esta implementación.

## Contrato

- `GET /api/health`: público, `200 {"status":"ok"}`.
- `POST /api/videos/{uuid}`: multipart `file` (`video/mp4`, hasta 100 MiB) y
  `thumbnail` (`image/webp`, hasta 5 MiB), ambos obligatorios y no vacíos.
  Devuelve 201, o 409 si ya existe. El UUID lo proporciona Spring o el seeder.
- `GET /api/videos/{uuid}`: 200 si existen los dos archivos, 404 si falta el
  directorio, 409 si la pareja está incompleta o es insegura.
- `DELETE /api/videos/{uuid}`: 204, también si no existe. Admite borrar una
  pareja incompleta; rechaza symlinks y contenido inesperado sin borrarlo.

Los tres endpoints de vídeos requieren `X-API-Key`; ausencia/error devuelve 401.
UUID inválido o partes ausentes: 422. Archivos vacíos: 400; tamaño: 413;
MIME/contenido inválido: 415. No se admiten nombres/rutas de destino del cliente.

Respuesta de GET/POST:

```json
{
  "id": "fa8c041e-35bc-49b4-9cd8-12de7a84b431",
  "videoUrl": "https://marramiau-protube.duckdns.org/media/fa8c041e-35bc-49b4-9cd8-12de7a84b431/video.mp4",
  "thumbnailUrl": "https://marramiau-protube.duckdns.org/media/fa8c041e-35bc-49b4-9cd8-12de7a84b431/thumbnail.webp"
}
```

## Archivos y concurrencia

`MEDIA_STORAGE_ROOT` contiene `videos/{uuid}/video.mp4`,
`videos/{uuid}/thumbnail.webp`, `tmp/` y `locks/`.
Los temporales nunca se publican bajo `/media/`. Se valida MP4 con ffprobe y WEBP
con Pillow (máximo 20 millones de píxeles). La pareja se publica por renombrado,
por lo que `tmp/` y `videos/` deben compartir filesystem. Se publican carpetas
0755 y archivos 0644; comprobar también permisos de los directorios padre.

Bloqueos `flock` por UUID coordinan GET/POST/DELETE incluso entre workers. Son
locales al disco de esta VM, no un sistema distribuido. Los pequeños archivos de
`locks/` permanecen para evitar carreras al recrearlos. No borrarlos en caliente.
Un cierre abrupto puede dejar temporales; no se borran automáticamente.
Solo el usuario del servicio y administradores deben poder escribir en este árbol.

## Configuración y despliegue coordinado

Requisitos: Python 3.10+, ffprobe en PATH y un entorno virtual con
`requirements.txt`. Configurar `MEDIA_STORAGE_ROOT`, `MEDIA_BASE_URL` (origen
HTTPS sin ruta) y `MEDIA_API_KEY` (secreto aleatorio de al menos 32 caracteres)
usando un archivo protegido fuera de Git. `media.env.example` no es un secreto
real ni se carga automáticamente. El proceso debe recibir sus variables.

Antes de cambiar OCI, con autorización:

1. Inspeccionar servicio systemd real, usuario, venv, EnvironmentFile, Nginx,
   espacio y permisos. Hacer backup del código/configuración e inventariar las
   URLs antiguas referenciadas por las BBDD. No copiar secretos al repositorio.
2. Instalar estos archivos y dependencias en el venv apropiado. Conservar el
   proceso escuchando únicamente en `127.0.0.1:8001` detrás de Nginx.
3. Conservar alias `/media/` a `/mnt/data/video-platform/videos/` y proxy `/api/`.
   El límite Nginx de 110 MiB limita el cuerpo antes de FastAPI; mantenerlo, pues
   el parser multipart puede usar temporales antes de validar tamaños aquí.
4. Coordinar el nuevo Spring antes del cambio: **el cliente actual utiliza
   `POST /api/videos`, Bearer Google y un único MP4; no es compatible**.
5. Reiniciar únicamente el servicio identificado. Verificar health, subida con
   UUID de prueba, URLs MP4/WEBP, MIME y Range 206 mediante Nginx, conflicto,
   existencia y DELETE. Confirmar que las URLs planas antiguas siguen sirviéndose.

No hay migración ni borrado de archivos antiguos. La reversión requiere restaurar
el código/configuración anterior coordinadamente con Spring; no borrar datos.
Los archivos publicados son públicos y pueden seguir en caché tras el DELETE.
La clave tiene acceso a todo el almacenamiento: protegerla y planificar rotación.

## Pruebas locales aisladas (Linux)

Con Python, ffmpeg y ffprobe instalados, desde este directorio y un venv de test:

```bash
python -m pip install -r requirements-test.txt
python -m pytest -q --cov=app --cov=clear_media --cov-report=term-missing --cov-fail-under=80
```

Generan un MP4 y un WEBP ficticios en directorios temporales. Usan TestClient:
no conectan con OCI, no necesitan claves reales ni borran multimedia del proyecto.
Cubren contrato, autorización, validación, limpieza de staging, conflictos,
concurrencia, symlinks y limpieza manual. No prueban Nginx, systemd ni red real.

## Limpieza exclusivamente manual

`clear_media.py` usa solo la biblioteca estándar y `MEDIA_STORAGE_ROOT` del
proceso. Selección obligatoria: `--all` o `--video-id UUID` (repetible).
Sin `--confirm` **solo muestra candidatos**. No consulta ni modifica BBDD.

Antes de confirmar: revisar referencias en **todos** los entornos, hacer backup
y detener subidas/borrados (el script administrativo no toma los locks de la API).
`--all` incluye directorios UUID canónicos y archivos planos MP4/WEBP heredados.
No sigue symlinks ni elimina archivos desconocidos; valida todos los candidatos
antes de borrar. No limpia temporales ni detecta huérfanos. Nunca ejecutarlo al
arrancar, desde cron ni asumiendo que la H2 local representa todo el almacenamiento.

Vista previa no destructiva desde el servidor:

```bash
python3 clear_media.py --all
```
