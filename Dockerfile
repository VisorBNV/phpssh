FROM php:7.3-fpm-alpine

RUN apk add --no-cache openssh gmp-dev

RUN docker-php-ext-install gmp \
    && docker-php-ext-enable gmp


CMD [ "php-fpm" ]