FROM php:8.4-cli
LABEL org.opencontainers.image.authors="stephen@stephenneal.net"

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

# Install Docker PHP extensions
RUN docker-php-ext-install -j$(nproc) \
        gmp \
    	exif \
        intl \
        pcntl \
        pdo \
        pdo_mysql \
        zip \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd \
    	--with-freetype=/usr/include/ \
    	--with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) \
    	gd

# Install composer from the composer base image
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer