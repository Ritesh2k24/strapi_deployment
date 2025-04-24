FROM node:18-alpine3.18

# Install required packages for native modules like sharp and better-sqlite3
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git python3 make g++

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

# Set working directory for initial install
WORKDIR /opt/

COPY package.json package-lock.json ./

RUN npm install -g node-gyp

# Install dependencies
RUN npm config set fetch-retry-maxtimeout 600000 -g && npm install

# Set PATH to include local node_modules
ENV PATH=/opt/node_modules/.bin:$PATH

# Switch to app directory
WORKDIR /opt/app

# ✅ Copy source code
COPY . .

# ✅ COPY the .env file (this is the missing piece)
#COPY .env .env

# copy the vite.config.js file
COPY vite.config.js .

# Build the Strapi admin panel
RUN npm run build

# Rebuild native modules like better-sqlite3 inside container
RUN npm rebuild better-sqlite3

# Set permissions
RUN chown -R node:node /opt/app

# Switch to non-root user
USER node

# Expose Strapi port
EXPOSE 1337

# Start Strapi in development mode
CMD ["npm", "run", "develop"]

