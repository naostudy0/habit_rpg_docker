FROM php:8.3-apache

# 必要パッケージのインストール
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    curl \
    libzip-dev \
    libonig-dev \
    libpng-dev \
    libpq-dev \
    && docker-php-ext-install pdo pdo_mysql zip

# Apache mod_rewrite 有効化
RUN a2enmod rewrite
RUN a2enmod vhost_alias

# Composer インストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Apache 設定ファイル
COPY ./apache/vhost.conf /etc/apache2/sites-available/000-default.conf

# 作業ディレクトリを設定
WORKDIR /var/www/html
