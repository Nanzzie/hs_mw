FROM --platform=$BUILDPLATFORM python:3.10 AS builder
EXPOSE 8000
WORKDIR /app 
COPY requirements.txt /app
RUN  apt update \
    && apt install -y build-essential
RUN pip3 install -r requirements.txt --no-cache-dir
COPY . /app 
COPY ./docker/entrypoint.sh .
CMD ["/bin/sh","/app/entrypoint.sh"]