FROM debian:bookworm-slim

RUN apt update
RUN apt install -y nginx vim

COPY . /var/www/html/

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]
