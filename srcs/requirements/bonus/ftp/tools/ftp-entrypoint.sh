#!/bin/sh

useradd -m $FTP_USER

echo "$FTP_USER:$FTP_PASS" | chpasswd

# Add the user to list of users that are allowed to log in
# echo "$FTP_USER" > /etc/vsftpd/vsftpd.userlist

# directory for secure_chroot
mkdir -p /var/run/vsftpd/empty

usermod -aG www-data $FTP_USER

echo "User $FTP_USER has been added with the specified password."

# generate cert
# mkdir /etc/vsftpd/ssl
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	 	-keyout /etc/vsftpd/ssl/vsftpd-selfsigned.key -out \
# 	 	/etc/vsftpd/ssl/vsftpd-selfsigned.crt -subj "/C=/ST=/L=/O=/OU=/CN="

exec "$@"
