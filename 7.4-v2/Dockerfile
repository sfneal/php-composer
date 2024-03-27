FROM php:7.4-cli
MAINTAINER Stephen Neal <stephen@stephenneal.net>

# Install dependencies
RUN apt-get update -y \
    && apt-get install -y \
        g++ \
        libfreetype6-dev \
		libgmp-dev \
		libicu-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libxpm-dev \
        libwebp-dev \
        libzip-dev \
        unzip \
        zip \
        zlib1g-dev

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN docker-php-ext-configure intl \
	&& docker-php-ext-configure gd \
	    --with-freetype=/usr/include/ \
	    --with-jpeg=/usr/include/ \
	&& docker-php-ext-install -j$(nproc) \
    	gd \
	&& docker-php-ext-install \
	    gmp \
	    intl \
	    pcntl \
	    pdo \
	    pdo_mysql \
	    zip

# Install composer from the composer base image
COPY --from=composer:1.9 /usr/bin/composer /usr/bin/composer

# Create a new group
RUN groupadd -r phpusers && useradd -r -g phpusers user

# Use the USER instruction to switch to the new user
USER myuser