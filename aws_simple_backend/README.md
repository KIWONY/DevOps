I have deployed a backend using FastAPI + Nginx on ECS Fargate. I have one NAT gateway and two availability zones.

1. aws acm을 사용하여 ssl 인증서를 발급받음.
2. 가비아에서 도메인 구입 
3. 로드밸런서에 api.도메인 A네임 별칭 부여
4. 프론트엔드 없음 
