FROM debian:bookworm-slim

ENV PHP_VERSION 8.2
ENV ADMINER_VERSION 4.8.1

RUN apt update
RUN apt install -y php${PHP_VERSION}-fpm php${PHP_VERSION}-mysql curl

WORKDIR /adminer

RUN curl https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php -o adminer.php 
RUN chown www-data: adminer.php

COPY ./tools/adminer-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/adminer-entrypoint.sh

ENTRYPOINT [ "adminer-entrypoint.sh" ]

CMD [ "php-fpm8.2", "-F" ]
