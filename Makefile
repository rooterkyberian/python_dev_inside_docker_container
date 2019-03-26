ifeq ($(runenv),local)
	RUN=
else
	RUN=./docker.sh run --rm app
endif

build:
	./docker.sh build

ifeq ($(runenv),local)
run: start-db
	flask run -p 5002
else
run:
	./docker.sh up
endif

check:
	$(RUN) black .
	$(RUN) flake8
	$(RUN) isort -rc .
	$(RUN) pytest
