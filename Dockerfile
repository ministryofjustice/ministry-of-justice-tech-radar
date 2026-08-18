# Build stage
FROM docker.io/library/node:26-alpine@sha256:aadf416b2cdce311a8811ba3f0608a61b77dbf997500e2eafe781b51f6a0b019 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY config.json custom.css about.md ./
COPY public/ public/
COPY radar/ radar/

RUN npm run build

# Production stage
FROM docker.io/library/node:26-alpine@sha256:aadf416b2cdce311a8811ba3f0608a61b77dbf997500e2eafe781b51f6a0b019

WORKDIR /app

RUN npm install -g serve \
    && addgroup -S appgroup \
    && adduser -S appuser -G appgroup

COPY --from=builder /app/build ./build

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 3000

CMD ["serve", "-s", "build", "-l", "3000"]