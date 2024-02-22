# Use an image with Node.js pre-installed
FROM node:latest

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json (if present) to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose port (if needed)
# EXPOSE 3000

# Command to run the application
CMD ["npm", "test"]

