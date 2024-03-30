variable "project_name" {
  type = string
  default = "roboshop"
}

variable "env" {
  type = string
  default = "dev"
}

variable "common_tags" {
  type = map
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terraform = true
    component = "mongodb"
  }
}