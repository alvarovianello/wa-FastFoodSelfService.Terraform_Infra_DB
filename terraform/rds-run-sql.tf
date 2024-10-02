resource "null_resource" "run_sql" {
  depends_on = [aws_db_instance.postgres_db]

  provisioner "local-exec" {
    command = <<EOT
      PGPASSWORD=var.dbPassword psql \
      -h ${aws_db_instance.postgres_db.endpoint} \
      -U var.dbUser \
      -d var.dbName \
      -f DDL.sql
    EOT
  }
}

# Output para exibir o endpoint do banco de dados
output "rds_endpoint" {
  value = aws_db_instance.postgres_db.endpoint
}

output "rds_instance_id" {
  value = aws_db_instance.postgres_db.id
}