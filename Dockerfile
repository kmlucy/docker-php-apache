FROM php:8.3-apache
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

# Install dependencies for PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libicu-dev \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install \
    zip \
    gd \
    intl \
    exif

# Enable Apache modules
RUN a2enmod rewrite headers

# Set recommended PHP.ini settings
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Set working directory
WORKDIR /var/www/html
