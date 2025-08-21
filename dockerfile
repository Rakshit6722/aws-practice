FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

RUN addgroup -g 1001 -S nodejs && adduser -S nodejs -u 1001

COPY . .

EXPOSE 8001

USER nodejs

CMD [ "node", "server.js" ]
