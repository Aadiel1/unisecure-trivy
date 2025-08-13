# Use a smaller, official Node image with security updates
FROM node:18-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files first to leverage Docker cache
COPY package*.json ./

# Install dependencies with verification
RUN npm ci --only=production

# Copy the rest of the app
COPY . .

# Use a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose port
EXPOSE 3000

# Start app
CMD ["node", "server.js"]
