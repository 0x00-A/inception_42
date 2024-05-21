#!/bin/sh

# Create the user
useradd -m $FTP_USER

# Set the password for the user
echo "$FTP_USER:$FTP_PASS" | chpasswd

# Add the user to list of users that are allowed to log in
echo "$FTP_USER" > /etc/vsftpd/vsftpd.userlist

# (Optional) Add the user to specific groups
# usermod -aG www-data

# directory for secure_chroot
mkdir -p /var/run/vsftpd/empty

# shared group between www-data and ftp user
groupadd sharedgroup && usermod -a -G sharedgroup www-data

chown -R $FTP_USER:sharedgroup /srv/ftp
chmod -R 775 /srv/ftp

# Print the result
echo "User $FTP_USER has been added with the specified password."

# generate cert
# mkdir /etc/vsftpd/ssl
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	 	-keyout /etc/vsftpd/ssl/vsftpd-selfsigned.key -out \
# 	 	/etc/vsftpd/ssl/vsftpd-selfsigned.crt -subj "/C=/ST=/L=/O=/OU=/CN="

exec "$@"