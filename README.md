# Docker Laravel MySQL Nginx for Development

# Introduction

Dockerize your Laravel project for easier development. This includes MySQL and Nginx

# Project Setup

| Service | Version |
| --- | --- |
| PHP FPM | 8.1 |
| MySQL | 5.7 |
| Nginx | Latest |
| Node | None |

1. Copy all files and directories in this repository to your Laravel project. Remember the supported Laravel version for PHP 8.1 is `Laravel 9 and 10`
2. If your project is new, generate a fresh .env file by duplicating the existing .env.example file.
    
    ```bash
    cp .env.example  .env
    ```
    
3. Start all containers in docker compose 
    
    ```bash
    docker compose up -d
    ```
    
4. Open interactive bash shell using Docker Compose
    
    ```bash
    docker compose exec -it app bash
    ```
    
5. Install the project dependencies using composer in the interactive bash shell.
    
    ```bash
    composer install
    ```
    
6. Generate an application key by running the following command:
    
    ```bash
    php artisan key:generate
    ```
    
7. Migrate the database tables by running the following command:
    
    ```bash
    php artisan migrate
    ```
    

```bash

```
