FROM node:16.13.1-alpine as build

WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH

COPY frontend/ .

RUN npm install --silent
RUN npm run build

FROM nginx:1.23.1
COPY --from=build /app/build /usr/share/nginx/html
COPY .docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY .docker/nginx/.htpasswd /etc/nginx/.htpasswd

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
