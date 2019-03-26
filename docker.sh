#!/bin/bash
export UID
export GID=$(id -g)
export USER=$(whoami)
COMPOSE_ARGS="-f docker-compose.yml -f docker-compose.dev.yml"
docker-compose ${COMPOSE_ARGS} "$@"
