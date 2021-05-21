resource "aws_security_group" "ec2" {
  name        = "ec2security"
  description = "Security group for EC2 instance"
 
  ingress {
    description = "Allow TLS for all"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      description = "Allow http traffic for all"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    
  }

  ingress {
      description = "OX-IP"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = var.sg_ips
    
  }
  egress {
      description = "Outbound rule"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "SG" = "Prod_EC2"
  }
}

resource "aws_security_group" "RDS_SG" {
    name = "RDS_Security"
    description = "SG for RDS"

    ingress  {
      description = "Allow EC2 instance"
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = [aws_security_group.ec2.id]
      self = false
      
    } 
  
}