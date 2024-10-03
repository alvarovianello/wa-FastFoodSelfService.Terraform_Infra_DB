variable "regionDefault" {
  default = "us-east-1"
}

variable "projectName" {
  default = "eks-fastfood"
}

variable "labRole" {
  default = "arn:aws:iam::659767469388:role/LabRole"
}

variable "accessConfig" {
  default = "API_AND_CONFIG_MAP"
}

variable "nodeGrop" {
  default = "NodeGroupFastFood"
}

variable "principalArn" {
  default = "arn:aws:iam::659767469388:role/voclabs"
}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}
