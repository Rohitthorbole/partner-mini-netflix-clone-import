#target group
resource "aws_lb_target_group" "target_group" {
  name     = "target-01"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}

#target group Import
import {
  to = aws_lb_target_group.target_group
  id = "arn:aws:elasticloadbalancing:us-east-1:304935836562:targetgroup/target-01/01c5db091dc8b038"
}

#ALB
resource "aws_lb" "alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id,aws_subnet.subnet4.id]
}

#ALB Import
import {
  to = aws_lb.alb
  id = "arn:aws:elasticloadbalancing:us-east-1:304935836562:loadbalancer/app/my-alb/6c4080b8190aad3e"
}