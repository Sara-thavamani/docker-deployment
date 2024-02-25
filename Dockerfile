# Stage 1: Build Angular application
FROM node:latest as angular
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g @angular/cli@latest  # Install the latest version of Angular CLI globally
RUN npm run build   # Assuming you want to build for production

# Stage 2: Serve Angular application with Apache HTTP Server
FROM httpd:alpine3.15

WORKDIR /usr/local/apache2/htdocs
COPY --from=angular /app/dist/demo-app/browser .
