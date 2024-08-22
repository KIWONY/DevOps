import json, uvicorn, logging

import grpc
from fastapi import FastAPI
import love_pb2, love_pb2_grpc
app = FastAPI()

channel = grpc.insecure_channel('grpc_server:6000', options=(('grpc.enable_http_proxy', 0),))
love_stub = love_pb2_grpc.LoveGrpcStub(channel)

@app.post("/love")
def communicate_love(speaker: str):
    bytes_data = speaker.encode('UTF-8')
    print(bytes_data)
    request = love_pb2.Input(approach=bytes_data)
    response = love_stub.Love(request)
    response = response.acceptance.decode('UTF-8')
    return response


if __name__ == "__main__":
    logging.info("start")
    uvicorn.run("main:app", host="0.0.0.0", port=8010, reload=True)