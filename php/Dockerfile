FROM php:7.2-fpm

RUN apt-get update \
	&& apt-get install -y \
	apt-file \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libmemcached-dev \
    zlib1g-dev \
    imagemagick \
    libmagickwand-dev \
    && apt-file update \



# install extensions
RUN pecl install xdebug \
    && pecl install swoole \
    && pecl install memcached\
    && pecl install imagick\
    && docker-php-ext-enable xdebug gd swoole memcached imagick

