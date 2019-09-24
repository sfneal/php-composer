# Start with the official Composer image and name it
FROM composer:1.9 AS composer

FROM php:7.3-stretch
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS
RUN apt-get update && apt-get install -y zip unzip libfreetype6-dev libjpeg62-turbo-dev libzip-dev

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# Install Docker PHP extensions
RUN docker-php-ext-install pdo pdo_mysql zip

# Install composer from the composer base image
COPY --from=composer /usr/bin/composer /usr/bin/composer