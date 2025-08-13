# Use a recent, secure Alpine-based Node 20 image
FROM node:20.19.4-alpine3.25

# Set working directory
WORKDIR /usr/src/app

# Create a non-root user and switch to it
RUN addgroup -S nodegroup && adduser -S nodeuser -G nodegroup
USER nodeuser

# Copy package.json only (lock file optional)
COPY --chown=nodeuser:nodegroup package.json ./

# Install production dependencies
RUN npm install --production

# Copy the rest of the app
COPY --chown=nodeuser:nodegroup . .

# Expose application port
EXPOSE 3000

# Add a basic healthcheck
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost:3000/ || exit 1

# Start the app
CMD ["node", "server.js"]
