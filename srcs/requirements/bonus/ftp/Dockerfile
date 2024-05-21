FROM debian:bookworm-slim

RUN apt update
RUN apt -y install vsftpd vim

COPY tools/ftp-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/ftp-entrypoint.sh


COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
EXPOSE 21

# user
# RUN useradd -M ftpuser && echo "ftpuser:password" | chpasswd

# RUN mkdir -p /home/ftpuser/ftp
# RUN echo "hello" > /home/ftpuser/ftp/hello.txt
# RUN chown -R ftpuser:ftpuser /home/ftpuser/ftp

# RUN mkdir -p /var/run/vsftpd/empty
# RUN chmod 755 /var/run/vsftpd/empty

# RUN mkdir -p /var/ftp && chown ftp:ftp /var/ftp

# RUN echo "ftpuser" >> /etc/vsftpd.userlist


ENTRYPOINT [ "ftp-entrypoint.sh" ]

CMD /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
