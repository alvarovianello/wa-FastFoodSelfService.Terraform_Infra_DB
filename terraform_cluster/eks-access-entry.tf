resource "aws_eks_access_entry" "eks-access-entry-fastfood" {
  cluster_name      = aws_eks_cluster.eks-cluster-fastfood.name
  principal_arn     = var.principalArn
  kubernetes_groups = ["fastfood-group-kubernetes"]
  type              = "STANDARD"
}

output "cluster_access_entry_id" {
  value       = "${var.projectName}#{var.principalArn}"
  description = "The Access Entry Id"
}