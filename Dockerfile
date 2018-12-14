FROM php:7.2-fpm

RUN apk add --no-cache openssh

CMD [ "php-fpm" ]