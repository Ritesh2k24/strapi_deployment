resource "aws_instance" "strapi_ec2" {
  ami                    = "var.ami_id" 
  instance_type          = "t2.small"
  key_name               = "master"
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y docker.io
              systemctl start docker
              systemctl enable docker
              docker pull ${var.image_uri}
              docker run -d -p 1337:1337 ${var.image_uri}
              EOF

  tags = {
    Name = "Strapi-Docker-Terraform"
  }

  vpc_security_group_ids = [aws_security_group.strapi_sg.id]
}

resource "aws_security_group" "strapi_sg" {
  name        = "strapi_sg"
  description = "Allow SSH and Strapi port"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_vpc" "default" {
  default = true
}
