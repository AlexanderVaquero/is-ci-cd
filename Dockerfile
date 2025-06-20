# Establecer la imagen base
FROM node:18-alpine AS base

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json (o yarn.lock)
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . .

# Construir la aplicación
RUN npm run build

# Etapa de producción
FROM base AS production
# Exponer el puerto
EXPOSE 4173

# Comando para ejecutar la aplicación
CMD ["npm", "run", "preview"]