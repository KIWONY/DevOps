FROM python:3.10.8


RUN apt-get update && \
    apt-get install -y python3-pip

WORKDIR /server

COPY . .


RUN pip install --no-cache-dir --upgrade -r /server/requirements.txt

RUN python -m grpc.tools.protoc --proto_path=./ --python_out=./ --grpc_python_out=./ love.proto

EXPOSE 6000

CMD ["/bin/bash"]