FROM php:5.6-apache

RUN apt-get update && apt-get install -y \
  imagemagick \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng12-dev \
  libghc-postgresql-libpq-dev \
  libpq-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/include/postgresql/ \
	&& docker-php-ext-install -j$(nproc) pgsql pdo_pgsql pdo

COPY ./wait-for-it/wait-for-it.sh /bin/wait-for-it.sh

COPY ./3.1.9/phpBB3 /var/www/html/

RUN chown www-data:www-data -R /var/www/html/

VOLUME /var/www/html/
