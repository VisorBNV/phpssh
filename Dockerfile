FROM php:7.3-fpm-alpine

RUN apk add --no-cache openssh gmp-dev

RUN docker-php-ext-install gmp \
    && docker-php-ext-enable gmp

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

CMD [ "php-fpm" ]