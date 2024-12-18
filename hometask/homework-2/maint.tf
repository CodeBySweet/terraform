# AWS EC2 Instance Configuration
# Includes: AMI, Instance Type, Tags, User Data, and Security Group
resource "aws_instance" "web" {
  ami                    = "ami-01816d07b1128cd2d"
  instance_type          = "t2.micro"
  tags = {
    Name = "my-terraform-webserver"
  }
  user_data              = file("${path.module}/script.sh") # Script to configure the instance
  vpc_security_group_ids = [aws_security_group.web_sg.id]   # Attach the security group
}


# Security Group to Allow HTTP Traffic
resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow inbound HTTP traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from all IPv4 addresses
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}


