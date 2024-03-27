FROM php:7.3.6
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Update OS
RUN apt-get update && apt-get install -y zip unzip libfreetype6-dev libjpeg62-turbo-dev libzip-dev

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# Install Docker PHP extensions
RUN docker-php-ext-install pcntl pdo pdo_mysql zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Create a new group
RUN groupadd -r phpusers && useradd -r -g phpusers user

# Use the USER instruction to switch to the new user
USER myuser