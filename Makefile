
help:
	@echo "  clean                       clean files"
	@echo "  install-dev-deps            install dev dependencies"
	@echo "  build-dev                   build docker image for developement"
	@echo "  build-prod                  build docker image for production"
	@echo "  run-dev-containers          run docker containers for developement"
	@echo "  run-prod-containers         run docker containers for production"
	@echo "  test                        run the testsuite"
	@echo "  lint                        check the source for style errors"
	@echo "  format                      format the python code"
	@echo "  check-vul                   check vulnerabilities"
	@echo "  run-local                   run the server in localhost with debug and autoreload (developpement mode)"
	@echo "  run                         run the server in localhost (production mode)"

.PHONY: clean
clean:
	@echo "--> Cleaning pyc files"
	find . -name "*.pyc" -delete

.PHONY: build-dev
build-dev:
	@echo "--> Building development image"
	docker-compose -f setup/docker-compose-dev.yaml build

.PHONY: run-dev
run-dev:
	@echo "--> Running development containers"
	docker-compose -f setup/docker-compose-dev.yaml up -d

.PHONY: stop-dev
stop-dev:
	@echo "--> Running development containers"
	docker-compose -f setup/docker-compose-dev.yaml down
