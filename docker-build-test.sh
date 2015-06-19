#!/bin/sh

echo "docker build tests..."

_CACHE_DIR="./m2_cache"

if [[ $1 = "-r" ]]; then
	docker build --tag=ft2test --rm ./build-test-docker/
fi

docker run -rm -it -v /root/.m2:${_CACHE_DIR} ft2buildTest