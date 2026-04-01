# Build stage
FROM node:25-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY config.json custom.css about.md ./
COPY public/ public/
COPY radar/ radar/

RUN npm run build

# Production stage
FROM node:25-alpine

WORKDIR /app

RUN npm install -g serve \
    && addgroup -S appgroup \
    && adduser -S appuser -G appgroup

COPY --from=builder /app/build ./build

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]