FROM debian:bookworm

RUN apt update
RUN apt -y install vsftpd vim

# RUN mkdir /etc/vsftpd

RUN rm /etc/vsftpd.conf
COPY vsftpd.conf /etc

# COPY ./tools/ftp-entryponit.sh /usr/local/bin
# RUN chmod +x /usr/local/bin/ftp-entryponit.sh

# ENTRYPOINT [ "ftp-entryponit.sh" ]

CMD [ "vsftpd" ]