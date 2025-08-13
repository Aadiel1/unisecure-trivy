# Use a recent, secure Alpine-based Node 20 image
FROM node:20.19.4-alpine3.25

# Set working directory
WORKDIR /usr/src/app

# Install essential packages and update base packages
RUN apk add --no-cache bash curl

# Copy package.json (lock file optional)
COPY package.json ./

# Install production dependencies
RUN npm install --production

# Copy the rest of the app
COPY . .

# Expose application port
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
