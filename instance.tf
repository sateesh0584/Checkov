provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0" 
  instance_type = "t2.micro"  
  iam_instance_profile = "test"
  ebs_optimized = true
  monitoring = true
  metadata_options {
       http_endpoint = "enabled"
       http_tokens   = "required"
  }
 network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
  root_block_device {
  encrypted     = true
  }

  tags = {
    Name = "example-instance"
  }
}

