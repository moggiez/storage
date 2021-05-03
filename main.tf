terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "moggies.io-terraform-state-backend"
    key            = "storage-terraform.state"
    region         = "eu-west-1"
    dynamodb_table = "moggies.io-storage-terraform_state"
  }
}

provider "aws" {
  region = var.region
}