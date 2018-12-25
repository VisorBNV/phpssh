FROM php:7.0-fpm-alpine

RUN apk add --no-cache git openssh gmp-dev libpng-dev && \
    docker-php-ext-install gmp && docker-php-ext-enable gmp && \
    docker-php-ext-install bcmath && docker-php-ext-enable bcmath && \
    docker-php-ext-install gd && docker-php-ext-enable gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN composer init && \
    composer global require hirak/prestissimo && \
    curl -LO https://deployer.org/releases/v4.3.4/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep && \
    composer global require deployphp/recipes ^4.0

CMD [ "php-fpm" ]