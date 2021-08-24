FROM php:7.4-cli
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Install yarn & other deps
RUN apt-get update \
    && apt-get install -y \
        zip \
        unzip \
        libfreetype6-dev \
		libgmp-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxpm-dev \
        libwebp-dev \
        libzip-dev

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd \
    --with-freetype-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-install \
    pcntl \
    pdo \
    pdo_mysql \
    zip \
	gmp

# Install composer from the composer base image
COPY --from=composer:1.9 /usr/bin/composer /usr/bin/composer