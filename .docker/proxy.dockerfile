FROM node:16.13.1-alpine

WORKDIR /app
EXPOSE 5000
ENV PATH /app/node_modules/.bin:$PATH

COPY proxy/ . 

RUN npm install --silent

CMD ["yarn", "dev"]
