FROM php:7.4-cli
LABEL org.opencontainers.image.authors="stephen@stephenneal.net"

# Install dependencies
RUN apt-get update -y \
    && apt-get install -y \
        g++ \
        imagemagick \
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
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer