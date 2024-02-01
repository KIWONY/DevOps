FROM --platform=linux/amd64 python:3.10.8

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN python3 -m pip install --upgrade pip
RUN apt-get update
RUN apt install python3-pip -y


# yes
RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 50051