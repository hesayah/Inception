
all:
	if [ -d /home/hesayah/data/wordpres ]; then \
		docker-compose -f srcs/docker-compose.yml build; \
		docker-compose -f srcs/docker-compose.yml up; \
	else \
		mkdir -p /home/hesayah/data/wordpress; \
		mkdir -p /home/hesayah/data/database; \
		docker-compose -f srcs/docker-compose.yml build; \
		docker-compose -f srcs/docker-compose.yml up; \
	fi \


clean:
	docker images rmi "docker images -aq"
	docker rm "docker ps -aq"

fclean: down
	docker volume rm -f srcs_dbase
	docker volume rm -f srcs_wpress 
	rm -rf /home/hesayah/data/wordpress
	rm -rf /home/hesayah/data/database
	docker image prune  -f -a
	docker system prune -f -a

re: fclean all
	
	
refresh:
	docker-compose -f srcs/docker-compose.yml down
	rm -rf /home/hesayah/data/wordpress/*
	rm -rf /home/hesayah/data/database/*
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up


down:
	docker-compose -f srcs/docker-compose.yml down

up:
	docker-compose -f srcs/docker-compose.yml up

build:
	docker-compose -f srcs/docker-compose.yml build

.phony: all clean fclean re refresh down up build