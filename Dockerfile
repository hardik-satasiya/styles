FROM nginx:stable-alpine

RUN apk update && apk add bash
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY ./build-styleguide /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]