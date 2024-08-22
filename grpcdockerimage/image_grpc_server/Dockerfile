FROM python:3.10.8


RUN apt-get update && \
    apt-get install -y python3-pip

WORKDIR /server

COPY image_grpc_server .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

RUN python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. love.proto

CMD ["/bin/bash"]

EXPOSE 6000