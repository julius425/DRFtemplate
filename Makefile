
help:
	@echo "  clean                       clean files"
	@echo "  install-dev-deps            install dev dependencies"
	@echo "  build-dev                   build docker image for developement"
	@echo "  build-prod                  build docker image for production"
	@echo "  stop-dev                    stop docker containers for development"
	@echo "  stop-prod                   stop docker containers for production"
	@echo "  run-dev                     run docker containers for developement"
	@echo "  run-prod                    run docker containers for production"

	@echo "  test                        run the testsuite"
	@echo "  lint                        check the source for style errors" # not implemented
	@echo "  format                      format the python code" # not implemented
	@echo "  check-vul                   check vulnerabilities" # not implemented

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

.PHONY: build-prod
build-dev:
	@echo "--> Building production image"
	docker-compose -f setup/docker-compose-prod.yaml build

.PHONY: run-prod
run-dev:
	@echo "--> Running production containers"
	docker-compose -f setup/docker-compose-prod.yaml up -d

.PHONY: stop-prod
stop-dev:
	@echo "--> Running production containers"
	docker-compose -f setup/docker-compose-prod.yaml down


.PHONY: test
test:
	@echo "--> Running unittest"
	pytest --verbose --cov=src --cov=tests --cov-report=term-missing --cov-report=xml:.artifacts/coverage.xml --junit-xml=.artifacts/tests.xml
