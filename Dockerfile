############################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM python:2.7

# File Author / Maintainer
MAINTAINER Sam Clarke

# Copy the application folder inside the container
COPY . /hello_world

# Get pip to download and install requirements:
RUN pip install -r /hello_world/requirements.txt

# Expose ports
EXPOSE 80

# Set the default directory where CMD will execute
WORKDIR /hello_world

# start server
# CMD ["gunicorn", "--config=gunicorn.py", "app:app"]
CMD ["gunicorn", "app:app"]

