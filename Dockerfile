FROM node:20-alpine

WORKDIR /usr/src/app

# Copy package files first for caching
COPY package.json package-lock.json* ./

# Install production dependencies
RUN npm install --production

# Copy rest of the app
COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
