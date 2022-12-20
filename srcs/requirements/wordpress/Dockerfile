FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install -y php7.3-fpm php7.3-mysql  php7.3-curl php7.3-xml php7.3-zip

RUN apt install -y mariadb-client sendmail curl

RUN mkdir -p /var/run/php/ && mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar  && mv wp-cli.phar /usr/local/bin/wp

COPY conf/script.sh /

RUN chmod +x script.sh

ENTRYPOINT ./script.sh