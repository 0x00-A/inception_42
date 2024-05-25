FROM debian:bullseye

RUN apt update
RUN apt -y install vsftpd

COPY tools/ftp-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/ftp-entrypoint.sh

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010

ENTRYPOINT [ "ftp-entrypoint.sh" ]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
