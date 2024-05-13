FROM debian:stable

RUN apt update

RUN apt install -y vim curl php8.2-fpm php-mysql inetutils-ping

# download wordpress
# download wordpress
RUN mkdir -p /srv/www
RUN chown www-data /srv/www
WORKDIR /srv/www
RUN curl https://wordpress.org/latest.tar.gz | tar zx
RUN chown www-data /srv/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /srv/www
RUN chown www-data /srv/www
RUN wp core download --path=/srv/www/wordpress --force --allow-root
RUN chown www-data /srv/www/wordpress
# RUN chmod 777 /srv/www/wordpress

COPY ./wordpress-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wordpress-entrypoint.sh

ENTRYPOINT [ "wordpress-entrypoint.sh" ]

CMD [ "php-fpm8.2", "-F" ]
