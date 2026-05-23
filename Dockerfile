# ---- Base ----
FROM oven/bun:1 AS base

WORKDIR /app

# ---- Dependencies ----
FROM base AS deps

COPY package.json bun.lockb* bun.lock* ./

RUN bun install --frozen-lockfile

# ---- Builder ----
FROM base AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Build Next.js app
RUN bun run build

# ---- Runner ----
FROM oven/bun:1-slim AS runner

WORKDIR /app

# Install curl for Coolify healthcheck
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

ENV NODE_ENV=production
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

COPY --from=builder /app/package.json ./
COPY --from=builder /app/bun.lockb* ./
COPY --from=builder /app/bun.lock* ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/next.config.* ./

EXPOSE 3000

CMD ["bun", "run", "start"]