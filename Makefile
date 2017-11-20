.PHONY: docker-create docker-build

docker-build:
	docker build --tag lighthouse-testcase:latest .

docker-create:
	docker create --tty --interactive \
	--name lighthouse-testcase \
	--volume ${PWD}/:/lighthouse-testcase \
	lighthouse-testcase

docker-sandbox: docker-build docker-create
