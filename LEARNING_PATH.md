# Terraform + AWS learning path

This is a practical, project-based path from beginner Terraform to production
AWS architecture. Each project is designed to be deployed locally for fast
feedback where practical and then verified against AWS before progressing.

## Learning rules

Every project must include:

- A clear architecture diagram and README walkthrough
- Pinned Terraform and provider versions
- Variables, locals, outputs, tags, and sensible resource dependencies
- `terraform fmt`, `validate`, `plan`, `apply`, and `destroy` instructions
- A verification method: application endpoint, AWS CLI command, or Console path
- Security controls appropriate for that level
- A cost and cleanup section before any real AWS deployment

## Service domains we will cover

| Domain | AWS services and concepts |
| --- | --- |
| Identity and access | IAM, STS, IAM roles, instance profiles, KMS, Secrets Manager, SSM Parameter Store |
| Networking | VPC, subnets, route tables, internet/NAT gateways, security groups, NACLs, Route 53, Elastic Load Balancing |
| Compute | Lambda, API Gateway, EC2, ECS, ECR, Auto Scaling |
| Storage and data | S3, DynamoDB, RDS, ElastiCache, Athena, Glue |
| Events and workflows | SQS, SNS, EventBridge, Step Functions, Kinesis |
| Security and governance | CloudTrail, Config, Backup, WAF, tagging, least privilege |
| Observability and delivery | CloudWatch Logs/Metrics/Alarms, CodeBuild, CodePipeline, CloudFormation |

## Project sequence

### Level 1 — Foundations

| # | Project | Main services | Objective |
| --- | --- | --- | --- |
| 01 | S3 static website | S3 | Create versioned, encrypted website storage and upload static content. **Complete.** |
| 02 | Secure network and IAM foundation | VPC, subnets, route tables, security groups, IAM | Build an isolated network baseline and least-privilege workload identity. |
| 03 | Encrypted configuration store | KMS, SSM Parameter Store, Secrets Manager, IAM | Store application configuration and secrets without hard-coding sensitive values. |

### Level 2 — Application building blocks

| # | Project | Main services | Objective |
| --- | --- | --- | --- |
| 04 | Serverless notes API | Lambda, API Gateway, DynamoDB, IAM, CloudWatch | Build a CRUD API with a NoSQL data store and logs. |
| 05 | Event-driven file processor | S3, SQS, Lambda, SNS, DLQ | Process uploads asynchronously and handle failed messages safely. |
| 06 | Relational application tier | RDS, Secrets Manager, security groups, KMS | Run a private database with secret rotation-ready credentials and encrypted storage. |

### Level 3 — Integrated systems

| # | Project | Main services | Objective |
| --- | --- | --- | --- |
| 07 | Containerized web application | ECR, ECS, ALB, CloudWatch, IAM | Ship a Docker application behind a load balancer. |
| 08 | Event and workflow platform | EventBridge, Step Functions, SQS, SNS, Lambda | Orchestrate reliable multi-step business workflows. |
| 09 | Data analytics pipeline | S3, Kinesis, Glue, Athena, CloudWatch | Ingest data, catalog it, and query it with SQL. |

### Level 4 — Production practices

| # | Project | Main services | Objective |
| --- | --- | --- | --- |
| 10 | Observability and governance baseline | CloudWatch, CloudTrail, Config, Backup, SNS | Add logs, alarms, audit trails, configuration monitoring, and backups. |
| 11 | Infrastructure delivery pipeline | CodeBuild, CodePipeline, S3, IAM | Plan and validate Terraform automatically on every change. |
| 12 | Production three-tier platform | VPC, ALB, ECS, RDS, ElastiCache, WAF, Route 53, CloudFront | Combine the prior skills into a secure, observable, scalable application. |

## Next project: 02 — Secure network and IAM foundation

### Objective

Create the network and identity layer that every later workload can reuse. No
application should be created before its access permissions and network
boundaries are clear.

### Architecture

```text
Internet
   |
Internet gateway
   |
VPC
├── Public subnet  → optional bastion or public test workload
└── Private subnet → future application and database workloads

IAM role + least-privilege policy → workload identity
Security group → explicit inbound and outbound traffic rules
```

### Terraform resources

- `aws_vpc`
- `aws_subnet` for public and private address ranges
- `aws_internet_gateway`
- Public and private route tables plus associations
- `aws_security_group`
- `aws_iam_role`, policy, and instance profile
- Outputs for VPC ID, subnet IDs, security-group ID, and role ARN

### Definition of done

1. Terraform creates the VPC, subnets, routes, security group, and IAM role.
2. The public subnet has a route to the internet gateway; the private subnet
   does not accept direct internet traffic.
3. The IAM role has only the permissions required for the project.
4. The AWS Console confirms the VPC topology and security-group rules.
5. `terraform destroy` removes all project resources cleanly.

## Long-term coverage goal

The core path above covers the AWS services most commonly used in application
platforms. After Level 4, optional focused labs can cover additional emulator
services such as Cognito, AppSync, SES, MSK, OpenSearch, EKS, MWAA, Transfer
Family, Bedrock runtime, and AWS Backup. Each one should be attached to a
realistic use case rather than added only to inflate the resource count.
