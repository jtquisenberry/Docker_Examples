# Graphweb

Build and run Graphweb with Docker Desktop. Make sure Docker Desktop is running,
then run these commands from the repository root.

## Build the image

```powershell
docker build -t graphweb-local .\graphweb
```

## Start Graphweb without Redis

```powershell
docker run --detach --name graphweb -p 8500:8500 graphweb-local
```

Open [http://localhost:8500](http://localhost:8500) in a browser. The app will
respond, but the visit counter will be disabled until Redis is running.

## Start Graphweb with Redis

If you want the visit counter enabled, use a Docker network so Graphweb can
reach Redis by the hostname `redis`:

```powershell
docker network create graphweb-network
docker run --detach --name graphweb-redis --network graphweb-network --network-alias redis redis:7-alpine
docker run --detach --name graphweb -p 8500:8500 --network graphweb-network graphweb-local
```

Open [http://localhost:8500](http://localhost:8500). Refresh the page to see
the visit counter increment.

## Stop and remove the containers

```powershell
docker stop graphweb
docker rm graphweb
```

If you started Redis, also remove it and the network:

```powershell
docker stop graphweb-redis
docker rm graphweb-redis
docker network rm graphweb-network
```
