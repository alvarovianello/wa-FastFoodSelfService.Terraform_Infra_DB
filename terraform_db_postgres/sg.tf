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
  }

  # Egress Rules for RDS
  egress {
    description = "All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "fastfooda_db_sg"
  }
}