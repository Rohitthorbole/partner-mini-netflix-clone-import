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