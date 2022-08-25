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

docker run -p 81:80 -p 5001:5001 -p 8081:8080 -p 5672:5672 -p 15672:15672 -p 5566:5566 --name u18p36f001c001 u18p36f001
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


# Update One Container in docker-compose App

https://stackoverflow.com/questions/39168239/update-only-one-container-via-docker-compose

Just run `docker-compose up -d` again (without `down` / `stop` / `kill` before).

Initial `docker-compose.yml`:

    version: "2"

    services:
      db1:
        command: mongod
        image: mongo:3.2.4
        ports:
          - "27020:27017"

      db2:
        command: mongod
        image: mongo:3.2.4
        ports:
          - "27021:27017"

Update `db2`:

    version: "2"

    services:
      db1:
        command: mongod
        image: mongo:3.2.4
        ports:
          - "27020:27017"

      db2:
        command: mongod
        image: mongo:3.2.6
        ports:
          - "27021:27017"

Run `docker-compose up -d` again:

    Pulling db2 (mongo:3.2.6)...
    3.2.6: Pulling from library/mongo
    47994b92ab73: Pull complete
    a3ed95caeb02: Pull complete
    71b6becd9768: Pull complete
    7d5d40f9dc7b: Pull complete
    9dc152e647de: Pull complete
    3f1f69340f17: Pull complete
    82a29b50f1d2: Pull complete
    97869c61a050: Pull complete
    50aa2bf3bccc: Pull complete
    03913f2c5b05: Pull complete
    Digest: sha256:29ee114c0ce96494553cd72f18d92935b36778b77bce167fc9962e442d8c7647
    Status: Downloaded newer image for mongo:3.2.6
    composetest_db1_1 is up-to-date
    Recreating composetest_db2_1 

The last two lines of the output show the expected behavior. 
