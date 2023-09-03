FROM php:7.4-apache

RUN apt-get update && apt-get install -y libonig-dev && \

    docker-php-ext-install pdo_mysql mysqli mbstring
