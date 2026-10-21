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
  subnets            = [aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id, aws_subnet.subnet4.id]
}

#ALB Import
import {
  to = aws_lb.alb
  id = "arn:aws:elasticloadbalancing:us-east-1:304935836562:loadbalancer/app/my-alb/6c4080b8190aad3e"
}

#listener
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.target_group.arn
    type             = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.target_group.arn
        weight = 1
      }
      stickiness {
        enabled  = false
        duration = 3600
      }
    }
  }
}

#listener Import
import {
  to = aws_lb_listener.listener
  id = "arn:aws:elasticloadbalancing:us-east-1:304935836562:listener/app/my-alb/6c4080b8190aad3e/2bcb9e28a9e7d921"
}