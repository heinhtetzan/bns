FROM oven/bun:1

# Set working directory
WORKDIR /app

# Copy only package + lock first (better caching)
COPY package.json bun.lockb* bun.lock* ./

# Install deps
RUN bun install

# Copy the rest of the app
COPY . .

# Expose dev port
EXPOSE 3000

# Start dev server
CMD ["bun", "dev"]