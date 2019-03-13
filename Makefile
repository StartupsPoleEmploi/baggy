.PHONY: build

build: ## Build the docker images
	docker build -t lbb/postal ./build/

init: ## Initialize the configuration and database
	docker-compose run --rm postal ./bin/postal initialize-config
	docker-compose run --rm postal ./bin/postal initialize

user: ## Create a user for administration
	docker-compose run --rm postal ./bin/postal make-user

start: ## Start the services in the foreground
	docker-compose up

start-daemon: ## Start and daemonize services
	docker-compose up -d

stop: ## Stop all services
	docker-compose rm --stop --force

restart: stop start ## Restart all services

randomstring: ## Generate a random 24-character string
	@cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -1

ESCAPE = 
help: ## Print this help
	@grep -E '^([a-zA-Z_-]+:.*?## .*|######* .+)$$' Makefile \
		| sed 's/######* \(.*\)/\n               $(ESCAPE)[1;31m\1$(ESCAPE)[0m/g' \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'
