# Build stage
FROM docker.io/library/node:24-alpine@sha256:d32cdf619f63fe0471182d08996dd516c6275bb5fd31ae06e55a570bd9e1ad43 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY config.json custom.css about.md ./
COPY public/ public/
COPY radar/ radar/

RUN npm run build

# Production stage
FROM docker.io/library/node:24-alpine@sha256:d32cdf619f63fe0471182d08996dd516c6275bb5fd31ae06e55a570bd9e1ad43

WORKDIR /app

RUN npm install -g serve \
    && addgroup -S appgroup \
    && adduser -S appuser -G appgroup

COPY --from=builder /app/build ./build

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]