variable "regionDefault" {
  default = ""
}

variable "projectName" {
  default = ""
}

variable "dbIdentifier" {
  default = ""
}

variable "dbName" {
  default = ""
}

variable "dbUser" {
  default = ""
}

variable "dbPassword" {
  description = "password DB"
  type        = string
  sensitive   = true
}