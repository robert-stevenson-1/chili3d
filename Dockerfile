# Use Node.js
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Install required tools
RUN apk add --no-cache wget unzip

# Download and extract the specified version
RUN wget https://github.com/xiangechen/chili3d/archive/refs/tags/0.6.0.zip && \
    unzip 0.6.0.zip && \
    mv chili3d-0.6.0/* . && \
    rm -rf chili3d-0.6.0 0.6.0.zip

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Expose port 8080
EXPOSE 8080
