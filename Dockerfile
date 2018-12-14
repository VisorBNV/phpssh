FROM php:7.3-fpm-alpine

RUN apk add --no-cache openssh

CMD [ "php-fpm" ]