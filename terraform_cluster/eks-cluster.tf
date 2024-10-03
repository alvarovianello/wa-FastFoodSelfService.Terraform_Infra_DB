resource "aws_eks_cluster" "eks-cluster-fastfood" {
  name     = var.projectName
  role_arn = var.labRole

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.regionDefault}e"]
    security_group_ids = [aws_security_group.sg-fastfood.id]
  }

  access_config {
    authentication_mode = var.accessConfig
  }
}

output "cluster_name" {
  value       = aws_eks_cluster.eks-cluster-fastfood.name
  description = "The Name of the cluster"
}