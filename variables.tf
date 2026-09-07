variable "aws_region" {
  description = "AWS Region where the S3 bucket will be created."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 static-website bucket."
  type        = string
}

variable "environment" {
  description = "Environment tag applied to the bucket."
  type        = string
  default     = "dev"
}
