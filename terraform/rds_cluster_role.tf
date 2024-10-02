resource "aws_rds_cluster_role_association" "rds-cluster-role-fastfood" {
  db_cluster_identifier = aws_db_instance.postgres_db.id
  feature_name          = "S3_INTEGRATION" 
  role_arn              = var.principalArn
}