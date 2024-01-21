# fastapi와 동일한 플랫폼 사용
FROM nginx:1.16.1-alpine

# 경로 중요함
# nginx의 메인 설정 파일 : /etc/nginx/nginx.conf 
# 이 경로에 있는 nginx.conf파일이 기존 (docker pull한)nginx 이미지의 conf 파일이다.
# nginx의 전반적인 설정을 관리, 지금 내가 작성한 ./nginx/nginx.conf 파일을 복사하여 주요동작을 구성한 것이다.
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf       

# 80번 포트만 개방 (expose : 주로 외부에서 컨테이너에 접속할 수 있도록 포트를 개방할 때)
# 로드밸런서로 들어온 트래픽은 타겟그룹을 80으로 두고, ecs에 있는 nginx로 흘러들어가도록 함.
# 컨테이너 실행 시 호스트와 컨테이너 간 포트 매핑으로 외부에서 접속 가능하도록 함.
EXPOSE 80 

CMD ["nginx", "-g", "daemon off;"]



# /etc/nginx/conf.d/nginx.conf 경로에 있는 파일은 nginx의 추가 설정 파일이다. 
# 주로 /etc/nginx/nginx.conf파일과 함께 로딩된다. 주로 개별 웹 사이트 또는 서비스에 대한 세부 구성을 정의한다.