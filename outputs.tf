output "bucket_name" {
  description = "Name of the deployed S3 bucket."
  value       = aws_s3_bucket.site.bucket
}

output "index_object_key" {
  description = "S3 key for the uploaded HTML page."
  value       = aws_s3_object.index.key
}

output "website_url" {
  description = "Public HTTP endpoint for the S3 static website."
  value       = "http://${aws_s3_bucket_website_configuration.site.website_endpoint}"
}

output "bucket_arn" {
  description = "ARN of the deployed bucket."
  value       = aws_s3_bucket.site.arn
}
