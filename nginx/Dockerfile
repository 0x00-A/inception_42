FROM alpine

# update and install utils
RUN apk update
RUN apk add nginx openssl vim curl

# setting the user
#RUN addgroup nginx
#RUN adduser -S -G nginx nginx
#USER nginx

# ssl
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out \
	 /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=/ST=/L=/O=/OU=/CN="

RUN rm /etc/nginx/http.d/default.conf
COPY ./conf/default.conf /etc/nginx/http.d

CMD ["nginx", "-g", "daemon off;"]

