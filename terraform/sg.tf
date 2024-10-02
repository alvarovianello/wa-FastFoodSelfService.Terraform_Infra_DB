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

resource "aws_security_group" "sg-fastfood-db" {
  name        = "SG-${var.projectName}-db"
  description = "Usado no RDS FastFood"
  vpc_id      = data.aws_vpc.vpc.id

  # Ingress Rules for RDS
  ingress {
    description = "PostgreSQL"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress Rules for RDS
  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}