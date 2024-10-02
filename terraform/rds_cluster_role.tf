resource "aws_rds_cluster_role_association" "rds-cluster-role-fastfood" {
  db_cluster_identifier = aws_db_instance.postgres_db.id
  role_arn              = var.principalArn
}