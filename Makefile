.PHONY: build test shell clean

build:
	docker build -t pm .

test:
	docker run --rm -v "${PWD}/test":/tmp pm my_address_file_geocoded.csv

shell:
	docker run --rm -it --entrypoint=/bin/bash -v "${PWD}/test":/tmp pm

clean:
	docker system prune -f