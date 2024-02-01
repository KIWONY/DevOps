import logging

import grpc

import test_pb2_grpc, test_pb2

grpc.insecure_channel('localhost:50051', options=(('grpc.enable_http_proxy', 0),))

def run_client():
    channel = grpc.insecure_channel('localhost:50051', options=(('grpc.enable_http_proxy', 0),))
    print(channel, "channel")
    stub = test_pb2_grpc.TestGrpcStub(channel)
    print(stub.Test, "stub")
    response = stub.Test(test_pb2.TestRequest(request_message='kokoko'))
    print(response, "response")
    print('client received: ' + response.response_message)


if __name__ == '__main__':
    logging.basicConfig()
    run_client()