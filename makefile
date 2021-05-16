init: down build up api-composer-install
up:
	docker-compose -f docker-compose.yml up -d
down:
	docker-compose -f docker-compose.yml down -v --remove-orphans
build:
	docker-compose -f docker-compose.yml build --pull
api-composer-install:
	docker-compose -f docker-compose.yml run --rm php-cli composer install
api-composer-update:
	docker-compose -f docker-compose.yml run --rm php-cli composer update
init-db:
	docker-compose -f docker-compose.yml run --rm php-cli vendor/bin/console doctrine:schema:drop --force && \
   docker-compose -f docker-compose.yml run --rm php-cli vendor/bin/console orm:schema-tool:create
clear-cache:
	docker-compose -f docker-compose.yml run --rm php-cli vendor/bin/console doctrine:cache:clear-metadata && \
	docker-compose -f docker-compose.yml run --rm php-cli vendor/bin/console doctrine:cache:clear-query