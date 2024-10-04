variable "regionDefault" {
  default = ""
}

variable "projectName" {
  default = ""
}

variable "labRole" {
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
  default = ""
}

variable "policyArn" {
  default = ""
}
