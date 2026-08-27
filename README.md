# Deploy a Static Website to AWS S3 with Terraform

A beginner-friendly Terraform project that deploys a public static website to
Amazon S3. It is designed to be cloned, configured, and applied directly to
your own AWS account.

## Problem this solves

Static websites are often deployed manually, which makes versioning, security
settings, and repeatability easy to miss. This project turns the entire S3
website setup into reviewed, repeatable Terraform code.

## Architecture

- Amazon S3 bucket for website hosting
- SSE-S3 AES-256 server-side encryption
- S3 Bucket Versioning for rollback capability
- Public read bucket policy for website delivery
