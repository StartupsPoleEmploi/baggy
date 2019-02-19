.PHONY: build

build:
	docker build -t lbb/postal ./build/

init:
	docker-compose run --rm postal ./bin/postal initialize-config
	docker-compose run --rm postal ./bin/postal initialize

user:
	docker-compose run --rm postal ./bin/postal make-user

start:
	docker-compose up

start-daemon:
	docker-compose up -d
	@echo "Access the web UI at http://localhost"

stop:
	docker-compose rm --stop --force
