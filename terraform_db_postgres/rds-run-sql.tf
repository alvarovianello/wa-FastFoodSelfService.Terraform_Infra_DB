resource "null_resource" "run_sql" {
  depends_on = [aws_db_instance.postgres_db]

  provisioner "local-exec" {
    command = <<EOT
      sleep 30  # segundos
      PGPASSWORD=${var.dbPassword} && psql -h ${aws_db_instance.postgres_db.address} -p 5432 -U ${var.dbUser} -d ${var.dbName} -f DDL.sql
    EOT
  }
}

output "rds_address" {
  value = aws_db_instance.postgres_db.address
}

output "rds_instance_id" {
  value = aws_db_instance.postgres_db.id
}