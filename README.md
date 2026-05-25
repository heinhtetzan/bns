This is a [Next.js](https://nextjs.org) project bootstrapped with [`bun js`](https://bun.com), [`Shadcn UI`](https://ui.shadcn.com).

## Getting Started

First, run the development server:

```bash
# 1. Start next-app
docker compose -f docker-local/docker-compose.yml up

# 1.1 Start next-app with build
docker compose -f docker-local/docker-compose.yml up --build

# 2. Stop next-app
docker compose -f docker-local/docker-compose.yml down
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.


## Manage dependencies

```bash
# 1. Enter the container
 docker exec -it next-app sh

# 2. Use bun, bunx to install dependencies
 bun install lodash

 bunx --bun shadcn@latest add sonner
```

## Build and Export Image

```bash
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  -t you-image-name:tag \
  .
```
