# Stage 1: Build Angular application
FROM node:latest as angular
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g @angular/cli@latest  # Install the latest version of Angular CLI globally
RUN npm run build   # Assuming you want to build for production

# Stage 2: Serve Angular application with Apache HTTP Server
FROM httpd:alpine3.15

# Install Chrome browser
RUN apk update && apk upgrade && \
    apk add --no-cache chromium

# Set Chrome binary path as environment variable
ENV CHROME_BIN=/usr/bin/chromium-browser

# Copy Angular build files
COPY --from=angular /app/dist/demo-app/browser /usr/local/apache2/htdocs

# Continue with your Dockerfile...
