
# Environment with docker containers and file with setting environment variables.
PHP 7.3.10-fpm
Nginx 1.17.4
PostgreSQL 11.5
MariaDB 10.4
NodeJS 13
Redis 6.0-rc

# Setting Container Nginx
 -> Expose ports:80, 8081, 3000 e 443

 -> Volumes (Obs: check in docker settings, if the drivers are shared): Aplicação:htdocs -> /var/www/html; Logs:nginx/logs -> /var/log/nginx; Virtual Host: nginx/sites -> /etc/nginx/conf.d
	
 -> Virtual Host: You can create a vhost like http://localhost / http://static.local / http://web.local / http://api.local 

# PHP container configuration
 -> Expose ports: 9000

 -> Volume (Obs: check in docker settings, if the drivers are shared): Aplicação: htdocs -> /var/www/html
	
 -> Libraries: You can abble the php libraries in the settings file. Ex: MBSTRING, GD, MCRYPT, PDO_MYSQL, etc.
	
# PostgreSQL container configuration
 -> Expose ports: 5432

 -> Volume (Obs: check in docker settings, if the drivers are shared): Aplicação: postgresql/data -> /var/lib/postgresql/data

 -> Connection settings: POSTGRES_DB = db_test; POSTGRES_USER = user_test; POSTGRES_PASSWORD = user_secret; POSTGRES_PORT = 5432;

# MariaDB container configuration

# NodeJS container configuration

# How use

-> Clone the repo:

   git clone 

-> Inside the folder "docker-php-nodejs-nginx-postgresql-mariadb-redis" copy the file "env-example" and rename to ".env"

   cp .env-example .env

-> Start the container:

   docker-compose up -d

-> You can add the domains in the hosts file

   127.0.0.1 localhost

   127.0.0.1 api.local

   127.0.0.1 static.local

-> You can add hosts and configs in the Virtualbox

   WINDOWS:
   ![Screenshot](conf-docker-virtualbox-windows.png)

-> Access the container shell:
    
	Nginx: $ docker exec -it nginx bash
    WINDOWS: winpty docker exec -it nginx bash

	PHP: $ docker exec -it php-fpm bash
	WINDOWS: winpty docker exec -it php-fpm bash

	PostgreSQL: $ docker exec -it postgresql bash
    WINDOWS: winpty docker exec -it postgresql bash
	
-> Open in the browser

   http://<HOST> or http://<HOST>:<PORT>

-> Access the database inside the container PostgreSQL

	psql dbname username
	
