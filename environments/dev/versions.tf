terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment after creating the state bucket and lock table.
  # backend "s3" {
  #   bucket         = "your-terraform-state-bucket"
  #   key            = "vpc/dev/terraform.tfstate"
  #   region         = "ca-central-1"
  #   dynamodb_table = "terraform-locks"
  #   encrypt        = true
  # }
}

provider "aws" {
  region = var.region
}
