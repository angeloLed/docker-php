FROM php:7.2.13-fpm

LABEL maintainer "Angelo Landino <angelolandino@hotmail.it>"

RUN apt-get update
RUN apt-get install -y autoconf pkg-config libssl-dev
RUN docker-php-ext-install bcmath pdo pdo_mysql

# Install composer
COPY --from=composer:1.8.0 /usr/bin/composer /usr/bin/composer

RUN apt-get install -y --no-install-recommends \
gpg-agent \
libpng-dev \
apt-transport-https \
software-properties-common \
openssh-client \
curl \
ca-certificates \
wget \
git \
gcc \
make \
libxrender1 \
libxtst6 \
zip \
unzip 

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