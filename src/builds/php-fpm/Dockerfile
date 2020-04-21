ARG PHP_FPM_VERSION=7.4-fpm
ARG PHP_FPM_ENV=development
ARG PHP_FPM_PORT=9000

FROM php:${PHP_FPM_VERSION} as php

LABEL Sysdomotic <sysdomotic@gmail.com>

WORKDIR /var/www/html/api

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpq-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libssl-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql pdo_pgsql mysqli mbstring exif pcntl bcmath gd opcache

# Get latest Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy opcache configration
COPY ./configs/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Copy main script
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# Permissions
RUN chown -R root:www-data /var/www/html
RUN chmod u+rwx,g+rx,o+rx /var/www/html
RUN find /var/www/html -type d -exec chmod u+rwx,g+rx,o+rx {} +
RUN find /var/www/html -type f -exec chmod u+rw,g+rw,o+r {} +

# Environment
ENV PHP_ENV=${PHP_FPM_ENV}
ENV PORT=${PHP_FPM_PORT}

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["php-fpm"]

EXPOSE ${PHP_FPM_PORT}