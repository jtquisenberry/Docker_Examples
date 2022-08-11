

# Run a Single Container in a Docker-Compose Network

This command starts a single service defined in a `docker-compose` YAML file. It also launches services that the target service depends on.

See https://stackoverflow.com/questions/36249744/interactive-shell-using-docker-compose.

```
docker-compose run --rm worker bash
```

In this example `worker` is the name of the service. The name of the service is what is in `docker-compose.yaml`.

Example:

```
version: '3'
services:
...
  worker:
    image: anax32/clree-fast-worker
    build: .
```

# Start `sh` in a Running Container

Suppose that `worker` is a running container. Run an interactive shell like this.

```
docker-compose exec worker sh
```


# Start Docker-Compose Interactively

See https://stackoverflow.com/questions/36249744/interactive-shell-using-docker-compose

This method does not seem to work in my tests. 

``` yml
version: "3"
services:
  app:
    image: app:1.2.3
    stdin_open: true # docker run -i
    tty: true        # docker run -t
```

However, this comment is interesting

TheFool, Even I got the same issue. Its better to run `docker-compose run <service_name>`.