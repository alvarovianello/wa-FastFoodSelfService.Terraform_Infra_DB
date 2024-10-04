resource "aws_eks_access_entry" "eks-access-entry-fastfood" {
  cluster_name      = aws_eks_cluster.eks-cluster-fastfood.name
  principal_arn     = var.principalArn
  kubernetes_groups = ["fastfood-group-kubernetes"]
  type              = "STANDARD"
}