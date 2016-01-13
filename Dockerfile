FROM php:5.6.15-apache
MAINTAINER Olivier olivier@bertrand.xyz

RUN a2enmod rewrite
RUN a2enmod headers

RUN apt-get update && apt-get install -y libfreetype6 libjpeg62-turbo libmcrypt4 libpng12-0 sendmail --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN buildDeps=" \
		libfreetype6-dev \
		libjpeg-dev \
		libldap2-dev \
		libmcrypt-dev \
		libpng12-dev \
		zlib1g-dev \
	"; \
	set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --enable-gd-native-ttf --with-jpeg-dir=/usr/lib/x86_64-linux-gnu --with-png-dir=/usr/lib/x86_64-linux-gnu --with-freetype-dir=/usr/lib/x86_64-linux-gnu \
	&& docker-php-ext-install gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mysqli
    




