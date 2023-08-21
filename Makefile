name := ft_transcendence

all:
	docker-compose --env-file .env.dev -f docker-compose.yml -f docker-compose.dev.yml up -d --build --force-recreate

dev:
	docker-compose --env-file .env.dev -f docker-compose.yml -f docker-compose.dev.yml up -d --build --force-recreate

prod:
	sed -i '' "s/^HOST=.*/HOST=$(ifconfig en0 | awk '/inet / {print $2}')/" .env.prod
	docker-compose --env-file .env.prod -f docker-compose.yml -f docker-compose.prod.yml up -d --build --force-recreate

build:
	docker-compose up -d --build

down:
	docker-compose --env-file .env.dev -f docker-compose.yml -f docker-compose.dev.yml down

stop:
	docker-compose --env-file .env.dev -f docker-compose.yml -f docker-compose.dev.yml stop

start:
	docker-compose start

restart:
	docker-compose restart

logs:
	#docker-compose logs -f
	docker-compose --env-file .env.dev -f docker-compose.yml -f docker-compose.dev.yml logs -f

clean: down
	docker-compose down -v --rmi all --remove-orphans

fclean: clean
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

re: fclean all

.PHONY: all build down re clean fclean start stop restart
