FROM --platform=linux/amd64 python:3.10.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y python3-pip
# yes
WORKDIR /client

COPY image_grpc_client .

RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

RUN apt update -y

EXPOSE 8010