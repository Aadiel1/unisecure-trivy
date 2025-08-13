# Use lightweight Node.js 20 Alpine image
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package files first (for caching)
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy the rest of the application
COPY . .

# Expose the app port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
