FROM node:alpine
WORKDIR /usr/app
COPY ./package.json ./
RUN yarn install
COPY ./ ./
RUN yarn run build

FROM nginx
COPY --from=0 /usr/app/build /usr/share/nginx/html

#after building image from this file you need to make port mapping (8080:80) to run it locally => the default port in nginx is 80