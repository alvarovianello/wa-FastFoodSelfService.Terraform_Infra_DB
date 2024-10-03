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

  tags = {
    Name = "fastfooda_db_sg"
  }
}

output "db_security_group_id" {
  value       = aws_security_group.sg-fastfood-db.id
  description = "The ID of the security group DB"
}