# ------------------------------------------------------------------------------
# Production image based on ubuntu:18.04 with python3
# ------------------------------------------------------------------------------

FROM ubuntu:18.04

WORKDIR /usr/src/app

# update, upgrade and install packages
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y curl python3 python3-distutils python3-apt
RUN apt-get install -y nano byobu

# install pip for Python 3.6
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN curl  https://bootstrap.pypa.io/pip/3.6/get-pip.py -o get-pip.py
RUN python3 get-pip.py

# copy flask-api requirements file and install modules
COPY ./requirements.txt ./
RUN pip install -r requirements.txt

# copy flask code
COPY ./app.py .


EXPOSE 5000
EXPOSE 5001
EXPOSE 80
EXPOSE 8080
# RabbitMQ
EXPOSE 5672
# RabbitMQ web interface
EXPOSE 15672
# flower (for celery)
EXPOSE 5566

