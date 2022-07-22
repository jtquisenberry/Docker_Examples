# Build Image from Dockerfile

This assumes that the Dockerfile is in the current directory and named "Dockerfile". 

```
docker build -t u18p36f001 .
```

# View Images

```
docker images
```

__Output__

```
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
u18p36f001   latest    13fd8393623e   13 seconds ago   329MB
```

# Run Container

```
docker run -p 5000:5000 upng001
```

# Start bash
``` bash
bash
```



# Install byobu


# Install nano

``` bash
apt-get install nano
```

# Install RabbitMQ

``` bash
apt-get install rabbitmq-server
```



# Install Celery

# Restart RabbitMQ

``` bash
service rabbitmq-server restart
```

## Check RabbitMQ Stataus after Restart

``` bash
rabbitmqctl "report"
```



# Start Celery

``` bash 
celery -A tasks worker --loglevel=INFO
```

# Install Flower

``` bash
pip install flower
```


-------------------

# How to Expose Additional Ports in Container

https://stackoverflow.com/questions/19335444/how-do-i-assign-a-port-mapping-to-an-existing-docker-container

1. Ensure the container is running.
1. List containers.

    ``` powershell
    docker container ls
    ```

1. Get the hash of the container.

    ``` powershell
    docker container inspect upng001c001
    ```

    Output

    ``` json
    ...
    [
      {
        "Id": "e5403b46def3175f8cbfb403e44ed0f862fb222ca77399597f6006bfaade2d56",
    ...
    ```

1. Stop the container.
1. Stop the Docker service.
1. Find the `hostconfig.json` file for the container.

   https://stackoverflow.com/questions/65546108/where-is-hostconfig-json-docker-desktop-wsl2-environment

1. On my machine it is:

    ```
    "\\wsl$\docker-desktop-data\data\docker\containers\e5403b46def3175f8cbfb403e44ed0f862fb222ca77399597f6006bfaade2d56\hostconfig.json"
    ```

1. Edit the ports.

    If the original data is this:

    ``` json
    "PortBindings":{"5000/tcp":[{"HostIp":"","HostPort":"5000"}]}
    ```

    Update it to this:

    ``` json
    "PortBindings":{"5000/tcp":[{"HostIp":"","HostPort":"5000"}],"80/tcp":[{"HostIp":"","HostPort":"81"}]}
    ```



1. Restart the Docker service.
1. Start the container.
