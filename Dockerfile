FROM php:7.4-apache

WORKDIR /var/www/html

COPY ./web /var/www/html

COPY ./db-dump /var/www/html

RUN apt-get update

RUN apt-get install -y libzip-dev zip mariadb-client

RUN docker-php-ext-install zip

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install mysqli

RUN a2enmod rewrite

EXPOSE 80