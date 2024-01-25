import grpc
import test_pb2_grpc, test_pb2
from concurrent import futures

class TestGRPC(test_pb2_grpc.TestGrpcServicer):
    """
    proto파일에서 정의했던 TestGrpcServicer 클래스를 상속받아 구현 
    grpc 서비스를 구현하는 클래스 
    """
    def Test(self, request, context):
        """
        request: 클라이언트로부터 받은 요청
        context: RPC 상황 정보 포함
        """
        return test_pb2.TestReply(response_message=f"Hello, {request.request_message}")


def server():
    print("server starts...")
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))        # gRPC 서버를 생성, ThreadPoolExecutor: 서버가 동시에 처리할 수 있는 요청의 최대 수
    test_pb2_grpc.add_TestGrpcServicer_to_server(TestGRPC(), server)
    server.add_insecure_port('[::]:50051')                                  # [::] : 모든 IP 주소에서의 접속을 허용
    server.start()

    server.wait_for_termination()                                           # 서버가 종료될 때까지 대기
    print("server end")

if __name__ == '__main__':
    server()