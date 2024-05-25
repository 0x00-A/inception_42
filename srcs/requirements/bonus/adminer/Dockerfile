FROM debian:bullseye

ENV PHP_VERSION 7.4
ENV ADMINER_VERSION 4.8.1

RUN apt update
RUN apt install -y php${PHP_VERSION}-fpm php${PHP_VERSION}-mysql curl

WORKDIR /adminer

RUN curl -sSL https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php -o adminer.php 
RUN chown www-data: adminer.php

RUN mkdir -p /run/php/
RUN chown -R www-data: /run/php

RUN sed -i '/^listen = /s/.*/listen = 0.0.0.0:9000/' /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

CMD php-fpm$PHP_VERSION -F
