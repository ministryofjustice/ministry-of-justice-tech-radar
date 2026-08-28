# Build stage
FROM docker.io/library/node:25-alpine@sha256:bdf2cca6fe3dabd014ea60163eca3f0f7015fbd5c7ee1b0e9ccb4ced6eb02ef4 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY config.json custom.css about.md ./
COPY public/ public/
COPY radar/ radar/

RUN npm run build

# Production stage
FROM docker.io/library/node:25-alpine@sha256:bdf2cca6fe3dabd014ea60163eca3f0f7015fbd5c7ee1b0e9ccb4ced6eb02ef4

WORKDIR /app

RUN npm install -g serve \
    && addgroup -S appgroup \
    && adduser -S appuser -G appgroup

COPY --from=builder /app/build ./build

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]