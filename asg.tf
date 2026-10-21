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

import {
  to = aws_ami.my_ami
  id = "ami-0dd0e712b45fff45c"
}