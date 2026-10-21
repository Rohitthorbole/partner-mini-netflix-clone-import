#ami
resource "aws_ami" "my_ami" {
  name                = "MyNetflixImage"
  description         = "hey"
  imds_support        = "v2.0"
  root_device_name    = "/dev/xvda"
  ena_support         = true
  virtualization_type = "hvm"
  ebs_block_device {
    delete_on_termination = false
    device_name           = "/dev/xvda"
    encrypted             = false
    iops                  = 3000
    snapshot_id           = "snap-0f9b2b1afd5ee3f92"
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}

#ami Import
import {
  to = aws_ami.my_ami
  id = "ami-0dd0e712b45fff45c"
}

#launch template
resource "aws_launch_template" "my_launch_template" {
  image_id      = aws_ami.my_ami.id
  instance_type = "t2.small"
  key_name      = "21-10"
  user_data     = "IyEvYmluL2Jhc2gKCnN5c3RlbWN0bCBlbmFibGUgbmdpbngKc3lzdGVtY3RsIHN0YXJ0IG5naW54IHx8IHN5c3RlbWN0bCByZXN0YXJ0IG5naW54"
}

#launch template Import
import {
  to = aws_launch_template.my_launch_template
  id = "lt-0981a76f32a15a8d6"
}