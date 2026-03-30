FROM docker.io/library/node:24.14.1-trixie AS build
WORKDIR /app
COPY package-lock.json package.json ./
RUN npm install
COPY . .
RUN npm run build

## Production image
FROM docker.io/library/nginx:1.29.7-trixie AS prod
COPY --from=build /app/build /usr/share/nginx/html
