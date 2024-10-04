resource "aws_security_group" "sg-fastfood" {
  name        = "SG-${var.projectName}"
  description = "Usado no EKS FastFood"
  vpc_id      = data.aws_vpc.vpc.id

  #Inbound
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound
  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "cluster_security_group_id" {
  value       = aws_security_group.sg-fastfood.id
  description = "The ID of the security group cluster"
}