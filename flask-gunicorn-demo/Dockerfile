# ------------------------------------------------------------------------------
# Production image based on ubuntu:latest with nginx & python3
# ------------------------------------------------------------------------------
# Ubuntu, Python3, Nginx, Gunicorn
FROM ubuntu:latest AS prod-react

WORKDIR /usr/src/app

# update, upgrade and install packages
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get upgrade -y
RUN apt-get install -y nginx python3 python3-apt python3-venv

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# copy flask-api requirements file and install modules
COPY ./requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# copy flask code
COPY ./app.py .

# ------------------------------------------------------------------------------
# Serve flask-api with gunicorn
# ------------------------------------------------------------------------------
EXPOSE 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--log-level", "debug"]
