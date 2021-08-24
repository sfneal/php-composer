# Start with the official Composer image and name it
FROM composer:1.9 AS composer

FROM php:7.4-cli
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Install yarn & other deps
RUN apt-get update -y \
    && apt-get install -y \
        libfreetype6-dev \
		libgmp-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxpm-dev \
        libwebp-dev \
        libzip-dev \
        unzip \
        zip

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd \
    --with-freetype=/usr/include/ \
    --with-jpeg=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) \
    	gd \
	&& docker-php-ext-install \
      gmp \
	    pcntl \
	    pdo \
	    pdo_mysql \
	    zip

# Install composer from the composer base image
COPY --from=composer /usr/bin/composer /usr/bin/composer