resource "aws_db_instance" "postgres_db" {
  allocated_storage   = 100
  storage_type        = "io2"
  iops                = 3000
  engine              = "postgres"
  engine_version      = "16.3"
  instance_class      = "db.t3.micro"
  identifier          = var.dbIdentifier
  db_name             = var.dbName
  username            = var.dbUser
  password            = var.dbPassword
  publicly_accessible = true
  skip_final_snapshot = true

  vpc_security_group_ids = [aws_security_group.sg-fastfood-db.id]
  db_subnet_group_name   = aws_db_subnet_group.postgres-subnet-group.name

  # Configurações de backup
  backup_retention_period = 0

  # Configurações de manutenção
  auto_minor_version_upgrade = false

  # Proteção contra exclusão
  deletion_protection = false

  # Desabilitar RDS Extended Support
  monitoring_interval          = 0
  performance_insights_enabled = false

  # Desabilitar escalabilidade automática do armazenamento
  max_allocated_storage = 100

  tags = {
    Name = "postgres_db"
  }
}

output "db_instance_identifier" {
  value       = var.dbIdentifier
  description = "The identifier of the RDS instance"
}