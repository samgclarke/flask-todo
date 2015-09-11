############################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM python:2.7

# File Author / Maintainer
MAINTAINER Sam Clarke

# Copy the application folder inside the container
COPY . /todo

# Get pip to download and install requirements:
RUN pip install -r /todo/requirements.txt

# Expose ports
EXPOSE 80

# Set the default directory where CMD will execute
WORKDIR /todo

# start server
# CMD ["gunicorn", "--config=gunicorn.py", "app:app"]
CMD ["gunicorn", "app:app"]

