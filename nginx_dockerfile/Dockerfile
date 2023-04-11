# fastapi와 동일한 플랫폼 사용
FROM nginx:1.16.1-alpine

# 경로 중요함
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf       

# nginx의 80번 포트로만 통신
EXPOSE 80 

CMD ["nginx", "-g", "daemon off;"]

