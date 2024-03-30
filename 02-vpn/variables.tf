variable "project_name" {
  type = string
  default = "roboshop"
}

variable "common_tags" {
  type = map
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = true
  }
}

variable "env" {
  type = string
  default = "dev"
}