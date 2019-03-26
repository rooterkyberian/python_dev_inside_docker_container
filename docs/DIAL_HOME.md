# Connecting to home

Have you tried connecting to some port on `localhost` from docker container?
Did you expect it to connect to your dev host? You maybe out of lack since by default docker containers have a separate networking stack (which normally is a good thing).

Sources:
* https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach

## problem with using `localhost`

From perspective of docker container, which is supposed to act as a separate system, `localhost` will point to the docker container, if anything at all (there is no requirement for container to define `localhost in its `/etc/hosts` file).

## sharing networking stack with host

You can share host network stack with container, but it takes you further from "how its setup in production", and is especially disadvantages in multi-container projects, since they can clash.
Obviously ability to scale containers is also lost in such configuration.
But yea, `localhost` will work just as it did for you when developing outside of docker container.

https://docs.docker.com/compose/compose-file/#host-or-none

```
version: '3.7'
services:
  web:
    # ...
    networks:
      hostnet: {}

networks:
  hostnet:
    external: true
    name: host
```

## host.docker.internal

`docker-for-mac` & `docker-for-windows` can use it today (2019.03), Linux users still need to wait for https://github.com/docker/libnetwork/pull/2348 .

Instead of contacting `localhost:1234` you should connect to `host.docker.internal:1234`.

### resolving reachable host IP by hand

```
export PROJECT_NAME=${PWD##*/}
docker network inspect ${PROJECT_NAME}_default -f '{{(index .IPAM.Config 0).Gateway}}'
```
