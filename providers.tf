
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }
#   backend "s3" {
#     bucket         = "tf-state-xking"
#     key            = "dev/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "tf-state-xking-locks"
#     encrypt        = true
#   }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = var.env
      Project = "ac-Challenge"
    }
  }
}
