import json, uvicorn

import grpc
from fastapi import FastAPI
import love_pb2, love_pb2_grpc
app = FastAPI()

channel = grpc.insecure_channel('0.0.0.0:6000', options=(('grpc.enable_http_proxy', 0),))
stub = love_pb2_grpc.LoveGrpcStub(channel)

@app.post("/love")
def communicate_love(speaker: str):
    bytes_data = bytes(json.dumps(speaker), encoding='UTF-8')
    response = stub.Love(love_pb2.Input(approach=bytes_data))
    return response


if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8010, reload=True)