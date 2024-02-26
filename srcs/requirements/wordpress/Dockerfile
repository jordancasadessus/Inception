FROM debian:buster

EXPOSE 9000

ARG SQL_DATABASE=${SQL_DATABASE}
ARG SQL_USER=${SQL_USER}
ARG SQL_PASSWORD=${SQL_PASSWORD}
ARG SQL_ROOT_PASSWORD=${SQL_ROOT_PASSWORD}
ARG WP_TITLE=${WP_TITLE}
ARG WP_ADMIN_USER=${WP_ADMIN_USER}
ARG WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
ARG WP_ADMIN_EMAIL=${WP_ADMIN_EMAIL}
ARG WP_USER=${WP_USER}
ARG DOMAIN_URL=${DOMAIN_URL}
ARG WP_PASSWORD=${WP_PASSWORD}
ARG WP_EMAIL=${WP_EMAIL}

RUN apt update -y
RUN apt-get install -y
RUN apt-get install wget -y
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client curl

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN chmod +x ./usr/bin/wp

RUN mkdir /run/php

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

ENTRYPOINT ["bash", "/var/www/wordpress/config.sh"]

# sudo docker exec -it wordpress /bin/bash