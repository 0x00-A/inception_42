# Inception

## System Overview
Inception is a comprehensive system administration and virtualization project from the 42 Network. The objective is to design and deploy a multi-service web infrastructure using Docker and Docker Compose. Every service operates within its own dedicated, custom-built container (using Alpine Linux or Debian) communicating over a private internal network.

This repository demonstrates practical implementation of containerization, network isolation, persistent data management, and reverse proxying.

## Architecture & Services
The infrastructure consists of the core LE(N)MP stack alongside several auxiliary services, mapped to the `aigounad.42.fr` domain.

### Core Infrastructure
*   **NGINX:** The primary reverse proxy and web server. Handles all TLS/SSL termination (HTTPS on port 443) and routes traffic to the appropriate backend services.
*   **WordPress:** The dynamic content management system running via PHP-FPM.
*   **MariaDB:** The relational database management system storing WordPress site data and user credentials.

### Extended Services (Bonus)
*   **Redis:** An in-memory data structure store acting as a caching layer to optimize WordPress database query performance.
*   **FTP Server (vsftpd):** File Transfer Protocol server mapped to the WordPress volume for direct file management.
*   **Adminer:** A lightweight, browser-based database management tool for interacting with the MariaDB instance.
*   **Static Website:** A standalone container serving static web assets.
*   **Portainer:** A centralized management interface for monitoring and controlling the Docker environments and containers.

## Technical Specifications
*   **Containerization:** All images are built from scratch using custom `Dockerfile`s. No pre-configured application images (e.g., `wordpress:latest`) are used.
*   **Networking:** Containers communicate securely via the internal `inception_net` Docker network. 
*   **Volumes:** Persistent data is mounted to host directories to prevent data loss during container lifecycle events (mapped to `/home/$USER/data/`).
*   **Security:** Passwords and sensitive configurations are injected at runtime via environment variables.

## Deployment Guide

### 1. Prerequisites
*   Docker engine installed.
*   Docker Compose installed.
*   `make` utility.

### 2. Host Configuration
Local domain resolution must be configured. Add the following entry to your `/etc/hosts` file (requires root privileges):
```text
127.0.0.1   aigounad.42.fr
```

### 3. Environment Setup
Create the required directory structure for persistent volume data on the host machine. You can do this manually or let the Makefile handle it depending on your exact configuration:
```bash
mkdir -p /home/$USER/data/wordpress
mkdir -p /home/$USER/data/mariadb
mkdir -p /home/$USER/data/adminer
mkdir -p /home/$USER/data/portainer
```

Clone the repository and configure the environment variables:
```bash
git clone <repository-url> inception
cd inception
cp srcs/.env.example srcs/.env
```
*Note: Edit the `srcs/.env` file to replace placeholder values with secure credentials before deploying.*

### 4. Build and Run
Use the provided `Makefile` at the root of the project to orchestrate the deployment:
```bash
make up
```

### 5. Access Points
Once deployed, the services are accessible via the following routes. You will need to accept the self-signed SSL certificate in your browser.
*   **WordPress:** `https://aigounad.42.fr`
*   **Static Website:** `http://localhost:3000`
*   **Portainer UI:** `https://localhost:9443` or `http://localhost:9000`
*   **FTP Connection:** `ftp://localhost:21`

## Makefile Reference
*   `make up` or `make`: Builds the images and starts all containers in the background.
*   `make down`: Stops and removes all containers and the associated internal network.
*   `make clean`: Tears down the infrastructure and removes all unused images, networks, and named volumes.
*   `make fclean`: Executes complete system prune, wiping all Docker data related to the project.
*   `make re`: Performs a complete rebuild (`fclean` followed by `up`).
