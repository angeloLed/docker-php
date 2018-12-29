FROM php:7.2.13-fpm

LABEL maintainer "Angelo Landino <angelolandino@hotmail.it>"

RUN apt-get update
RUN apt-get install -y autoconf pkg-config libssl-dev
RUN docker-php-ext-install bcmath

# Install composer
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip
RUN curl --silent --show-error https://getcomposer.org/installer | php

# Install Laravel dependencies
#RUN apt-get install -y \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \

#RUN docker-php-ext-install iconv mbstring \
#    && docker-php-ext-install zip --with-zlib-dir=/usr/include/ \
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install gd

WORKDIR /code

COPY . /code