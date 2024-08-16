FROM php:7.3.7
LABEL org.opencontainers.image.authors="stephen@stephenneal.net"

# Update OS
RUN apt-get update && apt-get install -y \
    ibfreetype6-dev \
    ibjpeg62-turbo-dev \
    ibzip-dev \
    unzip \
    zip

# Install PHP-GD extension (required by phpoffice/phpspreadsheet)
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# Install Docker PHP extensions
RUN docker-php-ext-install pcntl pdo pdo_mysql zip

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer