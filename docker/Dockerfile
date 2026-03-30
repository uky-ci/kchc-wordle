FROM docker.io/library/node:24.14.1-trixie AS build
WORKDIR /app
COPY package-lock.json package.json ./
RUN npm install
COPY . .
RUN npm run build

## Production image
FROM docker.io/library/nginx:1.29.7-trixie AS prod
COPY docker/etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir /usr/share/nginx/html/react-wordle
COPY --from=build /app/build /usr/share/nginx/html/react-wordle
COPY docker/build_system.sh .
RUN ./build_system.sh && rm ./build_system.sh
USER reactle
