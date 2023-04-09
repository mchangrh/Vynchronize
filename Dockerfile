FROM node:lts-alpine as builder
COPY package.json package-lock.json ./
RUN npm ci

FROM node:lts-alpine
WORKDIR /app
COPY --from=builder node_modules ./node_modules
COPY . .
CMD ["node",  "/app/server.js"]