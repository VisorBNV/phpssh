FROM php:7.0-fpm-alpine

RUN apk add --no-cache git openssh gmp-dev libpng-dev

RUN docker-php-ext-install gmp && docker-php-ext-enable gmp
RUN docker-php-ext-install bcmath && docker-php-ext-enable bcmath
RUN docker-php-ext-install gd && docker-php-ext-enable gd


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN composer init
RUN composer global require hirak/prestissimo
RUN composer global require deployphp/recipes ^4.0

CMD [ "php-fpm" ]