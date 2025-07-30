FROM node:18-alpine

WORKDIR /app

# Copy package files first for better Docker layer caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port
EXPOSE 3000

# Add simple Node.js health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD exit 1

# Start command
CMD ["npm", "start"]
