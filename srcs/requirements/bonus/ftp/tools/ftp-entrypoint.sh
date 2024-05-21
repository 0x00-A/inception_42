#!/bin/sh

# Define the username and password
FTP_USER="ftpuser"
FTP_PASS="ftppass"

# Create the user
useradd -m $FTP_USER

# Set the password for the user
echo "$FTP_USER:$FTP_PASS" | chpasswd

# Add the user to list of users that are allowed to log in
echo "ftpuser" > /etc/vsftpd.userlist

# (Optional) Add the user to specific groups
# usermod -aG www-data

# directory for secure_chroot
mkdir -p /var/run/vsftpd/empty

chown -R $FTP_USER /srv/ftp

# Print the result
echo "User $FTP_USER has been added with the specified password."

exec "$@"