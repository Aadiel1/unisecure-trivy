# Use official Node.js 20 Alpine image
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Set environment to production
ENV NODE_ENV=production

# Copy package files first for caching
COPY package*.json ./

# Install production dependencies
RUN npm ci --only=production

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
