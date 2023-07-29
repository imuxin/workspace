build-alpine: clean-alpine
	docker build --network=host -t slic/nvim-build:alpine -f Dockerfiles/nvim.Dockerfile .

build-ubuntu: clean-ubuntu
	docker build --network=host -t slic/nvim-build:ubuntu -f Dockerfiles/nvim-ubuntu.Dockerfile .

clean-alpine:
	docker rmi slic/nvim-build:alpine 2> /dev/null || true

clean-ubuntu:
	docker rmi slic/nvim-build:ubuntu 2> /dev/null || true

run-alpine:
	docker run -ti --network=host --rm slic/nvim-build:alpine bash

run-ubuntu:
	docker run -ti --network=host --rm slic/nvim-build:ubuntu bash
