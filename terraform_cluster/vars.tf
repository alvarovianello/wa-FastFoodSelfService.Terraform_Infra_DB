variable "regionDefault" {
  default = ""
}

variable "projectName" {
  default = ""
}

variable "labRole" {
  description = "ARN da role do Lab"
  type        = string
  sensitive   = true
}

variable "accessConfig" {
  default = ""
}

variable "nodeGrop" {
  default = ""
}

variable "principalArn" {
  description = "ARN principal"
  type        = string
  sensitive   = true
}

variable "policyArn" {
  default = ""
}
