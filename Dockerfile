# ------------------------------------------------------------------------------
# Production image based on ubuntu:latest with nginx & python3
# ------------------------------------------------------------------------------
# Ubuntu, Python3, Nginx, Gunicorn
FROM ubuntu:latest as prod-react

WORKDIR /usr/src/app

# update, upgrade and install packages
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y nginx curl python3 python3-distutils python3-apt

# install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py

# copy flask-api requirements file and install modules
COPY ./requirements.txt ./
RUN pip install -r requirements.txt
RUN pip install gunicorn

# copy flask code
COPY ./app.py .

# ------------------------------------------------------------------------------
# Serve flask-api with gunicorn
# ------------------------------------------------------------------------------
EXPOSE 5000
CMD gunicorn --bind 0.0.0.0:5000 app:app --log-level debug
