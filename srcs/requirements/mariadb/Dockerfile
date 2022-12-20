FROM debian:buster

RUN groupadd -r mysql && useradd -r -g mysql mysql

RUN	apt update && apt upgrade -y

RUN apt install mariadb-server -y

RUN chown mysql:mysql /var/lib/mysql && mkdir -p /var/log/mysql && chown mysql:mysql /var/log/mysql && mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

COPY conf/script.sh /

RUN chmod +x script.sh

ENTRYPOINT ./script.sh