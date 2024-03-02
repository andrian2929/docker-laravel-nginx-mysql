FROM php:8.1-fpm

LABEL maintainer="Andrian Putra Ramadan <ramadanandrian89@gmail.com>"

ARG NODE_VERSION=20

COPY ./composer.json /var/www/

WORKDIR /var/www

ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libonig-dev \
    libzip-dev \
    libgd-dev \
    redis-server \
    && install-php-extensions pdo_mysql \
    mbstring \
    zip \
    exif  \
    pcntl  \
    gd  \
    mysqli \
    bcmath \
    calendar \
    iconv \
    ctype \
    intl \
    xml \
    mysqli \
    opcache \
    pdo \
    pdo_mysql \
    pgsql \
    zip \
    redis \
    pgsql \
    pdo_pgsql \
    && docker-php-ext-configure gd --with-external-gd \
    # Install composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    # Install nodejs
    && curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get install -y nodejs \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 www && \
    useradd -u 1000 -ms /bin/bash -g www www

USER www

COPY --chown=www:www . /var/www

EXPOSE 9000

CMD ["php-fpm"]
