# Debugging applicaiton hosted inside docker container


# Remote debug

You can think about container as a separate machine.
This means that you can use remote debuggers on it as well (if not better) as you would with physical host.

Examples:

* [PyCharm Professional Remote debugger](https://www.jetbrains.com/help/pycharm/remote-debugging-with-product.html)
* [wdb](https://github.com/Kozea/wdb)


# pdb

Your old-school interactive debugger can of course also be used.
The trick is that when typically running `docker run` command both stdout/stdin are closed.
To open use either add `-ti` option your docker container, or even better add it to your development docker-compose config.

docker-compose.dev.yml
```
services:
  app:
    stdin_open: true
    tty: true
```
