FROM debian:buster

RUN apt update && apt upgrade -y

RUN apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -out /etc/nginx/ssl/crt.crt \
	-keyout /etc/nginx/ssl/key.key -subj "/C=FR/ST=France/L=Paris/O=42_curs/OU=ile-de-france/CN=hesayah.42.fr"

CMD ["nginx", "-g", "daemon off;"]


