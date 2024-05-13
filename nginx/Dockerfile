FROM alpine

# update and install utils
RUN apk update
RUN apk add nginx openssl vim curl

# setting the user
#RUN addgroup nginx
#RUN adduser -S -G nginx nginx
#USER nginx

WORKDIR /etc/nginx

# ssl
RUN mkdir ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	 -keyout ./ssl/nginx-selfsigned.key -out \
	 ./ssl/nginx-selfsigned.crt -subj "/C=/ST=/L=/O=/OU=/CN="

EXPOSE 444

RUN rm http.d/default.conf
COPY ./conf/default.conf ./http.d

CMD ["nginx", "-g", "daemon off;"]

