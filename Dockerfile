# 1. ELIGIMOS LA BASE
# Usamos una imagen oficial de Node. "alpine" es una versión de Linux muy ligera (buena práctica).
FROM node:18-alpine

# 2. CREAMOS EL DIRECTORIO DE TRABAJO
# Es como hacer un "cd /app" dentro del contenedor.
WORKDIR /app

# 3. COPIAMOS LAS DEPENDENCIAS
# Primero copiamos solo el package.json. ¿Por qué no todo?
# Para aprovechar la caché de Docker. Si no cambias dependencias, este paso se salta en el futuro.
COPY package*.json ./

# 4. INSTALAMOS DEPENDENCIAS
# Esto se ejecuta DENTRO de la imagen mientras se crea.
RUN npm install

# 5. COPIAMOS EL CÓDIGO FUENTE
# Ahora sí, copiamos el resto de tus archivos (server.js, etc.) al contenedor.
COPY . .

# 6. EXPONEMOS EL PUERTO
# Documentamos que la app usa el puerto 3000.
EXPOSE 3000

# 7. COMANDO DE INICIO
# Esto es lo que ejecutará el contenedor cuando arranque de verdad.
CMD ["node", "server.js"]
