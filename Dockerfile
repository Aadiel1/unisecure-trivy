# Use a recent, secure Alpine-based Node 20 image
FROM node:20-alpine

# Set working directory
WORKDIR /usr/src/app

# Copy package.json first (lock file optional)
COPY package.json ./

# Install production dependencies as root
RUN npm install --production

# Create a non-root user and switch ownership
RUN addgroup -S nodegroup && adduser -S nodeuser -G nodegroup \
    && chown -R nodeuser:nodegroup /usr/src/app

# Switch to non-root user for running the app
USER nodeuser

# Copy the rest of the app
COPY --chown=nodeuser:nodegroup . .

# Expose application port
EXPOSE 3000

# Add a basic healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost:3000/ || exit 1

# Start the app
CMD ["node", "server.js"]
