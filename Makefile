name := ft_transcendence

all:
	docker-compose --env-file .env up -d --build --force-recreate

build:
	docker-compose up -d --build

down:
	docker-compose down

stop:
	docker-compose stop

start:
	docker-compose start

restart:
	docker-compose restart

logs:
	docker-compose logs -f

#clean: down
#	docker-compose down -v --rmi all --remove-orphans

#fclean: clean
#	#rm -rf ../data
#	#docker system prune --volumes --all --force
#	#docker network prune --force
#	#docker volume prune --force

#re: fclean all

.PHONY: all build down re clean fclean start stop restart init infra front back
