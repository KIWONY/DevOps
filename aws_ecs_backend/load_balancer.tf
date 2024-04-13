# 로드밸런서
resource "aws_lb" "alb" {
  name                = "alb"
  internal            = false
  load_balancer_type  = "application"
  subnets             = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  security_groups     = [aws_security_group.load_balancer.id]
}

# 타켓그룹 
# VPC 내의 인스턴스를 타겟으로 설정하며, HTTP 프로토콜과 IP 타겟 유형을 사용
resource "aws_lb_target_group" "backend" {
  name        = "backend-lb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    path = "/health"
    matcher = "200"
  }
}

# http 리스너 -> 리다이렉트 443 -> 443에서는 
resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.alb.id
  port              = "80"
  protocol          = "HTTP"
  depends_on        = [aws_lb_target_group.backend]

  default_action {
    type = "redirect"
    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

}

# http 리스너에 대한 라우팅 룰
# 
resource "aws_lb_listener_rule" "backend" {
  listener_arn = aws_lb_listener.backend.arn
  priority = 50000
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }
  condition {
    path_pattern { values = ["/*"] }
  }
}

resource "aws_lb_listener" "backend_https" {
  load_balancer_arn = aws_lb.alb.id
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  depends_on        = [aws_lb_target_group.backend]
  certificate_arn   = var.aws_acm_certificate_backend

  default_action {
    target_group_arn = aws_lb_target_group.backend.id
    type             = "forward"
  }
}