terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }

  backend "s3" {
    bucket = "sureshvadde"
    key    = "vpn"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking"
  }
}

provider "aws" {
  region = "us-east-1"
}