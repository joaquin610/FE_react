# Usar la imagen oficial de Node.js como base
FROM node:16-alpine

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el archivo package.json y package-lock.json al contenedor
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto del código de la aplicación al contenedor
COPY . .

# Construir la aplicación React
RUN npm run build

# Instalar el servidor http para servir la aplicación de manera estática
RUN npm install -g serve

# Exponer el puerto en el que la aplicación estará corriendo
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD ["serve", "-s", "build", "-l", "3000"]

# Las líneas a continuación son opcionales, pero pueden ser útiles para configurar variables de entorno
# ENV NODE_ENV production

# docker build -t be_orders_service . 
# docker run -d --name fe_react_container -p 3000:3000 fe_react 