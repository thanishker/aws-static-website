provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Project     = "terraform-s3-static-website"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}
