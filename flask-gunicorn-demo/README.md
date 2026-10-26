# Flask Gunicorn Demo

Build and run this Flask app with Docker Desktop. Make sure Docker Desktop is
running, then run these commands from the repository root.

## Build the image

```powershell
docker build -t flask-gunicorn-demo .\flask-gunicorn-demo
```

## Start the container

```powershell
docker run --detach --name flask-gunicorn-demo -p 5000:5000 flask-gunicorn-demo
```

Open [http://localhost:5000](http://localhost:5000) in a browser. The app
displays "Hello, World!" followed by the container hostname, IP address, Linux
distribution version, and Python version.

## Stop and remove the container

```powershell
docker stop flask-gunicorn-demo
docker rm flask-gunicorn-demo
```
