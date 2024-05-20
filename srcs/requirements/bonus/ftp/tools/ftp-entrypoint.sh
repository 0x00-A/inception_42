#!/bin/sh

# Define the username and password
FTP_USER="ftpuser"
FTP_PASS="ftppass"

# Create the user
useradd -m $FTP_USER

# Set the password for the user
echo "$FTP_USER:$FTP_PASS" | chpasswd

# (Optional) Add the user to specific groups
usermod -aG www-data

# Print the result
echo "User $FTP_USER has been added with the specified password."