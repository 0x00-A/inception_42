FROM debian:bullseye

ENV PHP_VERSION 7.4

RUN apt update \
&& apt -y install redis-server php${PHP_VERSION}-redis

CMD [ "redis-server", "--protected-mode no" ]
