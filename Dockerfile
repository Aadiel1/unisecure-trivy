FROM node:20-alpine

WORKDIR /usr/src/app

# Copy package.json only (no lock file needed)
COPY package.json ./

# Install production dependencies
RUN npm install --production

# Copy the rest of the app
COPY . .

EXPOSE 3000

CMD ["node", "server.js"]
