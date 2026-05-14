# Inception (42 Network)

## System Overview
Inception is a comprehensive system administration and virtualization project. The objective is to design and deploy a multi-service web infrastructure using Docker and Docker Compose. Every service operates within its own dedicated, custom-built container (using Alpine Linux or Debian) communicating over a private internal network.

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
Local domain resolution must be configured. Add the following entry to your `/etc/hosts` file:
```text
127.0.0.1   aigounad.42.fr
