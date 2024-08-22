import love_pb2_grpc, love_pb2, grpc
from concurrent import futures
import json

class LoveGRPC(love_pb2_grpc.LoveGrpcServicer):
    def Love(self, request, context):

        """
        request: 클라이언트로부터 받은 요청 
        context: RPC 상황 정보 포함
        """
        try:
            approach = request.approach.decode('utf-8')
            reply = f"grpc love, {approach} and pong"
            reply_msg = bytes(reply, encoding="UTF-8")
            accept = love_pb2.Output(acceptance=reply_msg)
            return accept
        
        
        except Exception as e:
            # 'errors'를 올바르게 정의하고 사용
            context.set_code(grpc.StatusCode.ABORTED)
            print(e)
            return str(e)
        
def server():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))        # gRPC 서버를 생성, ThreadPoolExecutor: 서버가 동시에 처리할 수 있는 요청의 최대 수
    love_pb2_grpc.add_LoveGrpcServicer_to_server(LoveGRPC(), server)
    server.add_insecure_port('[::]:6000')                                  # [::] : 모든 IP 주소에서의 접속을 허용
    server.add_insecure_port('grpc_server:6000')
    server.start()
    print("server starts...")
    server.wait_for_termination()                                           #

if __name__ == '__main__':
    server()