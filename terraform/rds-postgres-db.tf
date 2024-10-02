resource "aws_db_instance" "postgres_db" {
  allocated_storage      = 20                                             # Armazenamento alocado (100 GiB)
  storage_type           = "io2"                                          # SSD de IOPS provisionadas
  iops                   = 3000                                           # 3000 IOPS provisionadas
  engine                 = "postgres"                                     # Motor do banco de dados PostgreSQL
  engine_version         = "16.3"                                         # Versão PostgreSQL 16.3
  instance_class         = "db.m5d.large"                                 # Classe da instância
  db_name                = var.dbName                                     # Nome do banco de dados
  username               = var.dbUser                                     # Nome de usuário principal
  password               = var.dbPassword                                 # Senha do banco de dados
  publicly_accessible    = true                                           # Acesso público (IP público)
  db_subnet_group_name   = aws_db_subnet_group.postgres_subnet_group.name # Grupo de sub-redes (padrão)
  vpc_security_group_ids = [aws_security_group.sg-fastfood-db.id]         # ID do grupo de segurança (alterar para o existente)
  availability_zone      = "${var.regionDefault}a"                        # Zona de disponibilidade
  skip_final_snapshot    = true                                           # Desabilitar snapshots finais

  # Configurações de backup
  backup_retention_period = 0 # Desabilitar backups automatizados

  # Configurações de manutenção
  auto_minor_version_upgrade = false # Desabilitar upgrades automáticos de versão secundária

  # Proteção contra exclusão
  deletion_protection = false # Proteção contra exclusão desativada

  # Desabilitar RDS Extended Support
  monitoring_interval          = 0     # Monitoramento desativado
  performance_insights_enabled = false # Desativar Performance Insights

  # Desabilitar escalabilidade automática do armazenamento
  max_allocated_storage = 20 # Escalabilidade automática desativada (limitada ao armazenamento alocado)

  lifecycle {
    ignore_changes = [password]
  }
}