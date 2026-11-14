# Dockerfile
# Usa una imagen base oficial de Python. Elige una versión específica para consistencia.
FROM python:3.13-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia solo el archivo de requerimientos primero para aprovechar el cache de Docker
COPY requirements.txt .

# Instala solo las dependencias de ejecución (Flask, Flask-WTF y Gunicorn)
# --no-cache-dir reduce el tamaño de la imagen
# --require-hashes instala solo las versiones exactas del archivo de bloqueo
# --only-binary evita ejecutar scripts de instalación de paquetes fuente
RUN pip install --no-cache-dir --require-hashes --only-binary :all: -r requirements.txt

# Crea un usuario sin privilegios para no ejecutar la aplicación como root
RUN useradd --create-home --shell /usr/sbin/nologin appuser

# Copia el código de la aplicación (solo la carpeta app)
COPY app/ ./app/

# A partir de aquí el contenedor se ejecuta como el usuario sin privilegios
USER appuser

# Expón el puerto en el que Gunicorn servirá la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación usando Gunicorn cuando el contenedor inicie
# --preload carga la aplicación una sola vez, así los 4 workers comparten la clave CSRF
CMD ["gunicorn", "--workers=4", "--preload", "--bind=0.0.0.0:8000", "app.app:app"]
