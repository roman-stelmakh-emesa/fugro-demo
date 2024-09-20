terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "eu-central-1"
  profile = "default"

  default_tags {
    tags = {
      "owner"       = "Roman Stelmakh"
      "application" = "API Gateway Demo"
    }
  }
}
