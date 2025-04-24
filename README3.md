🚀 Project Summary: TASK - 6 
Title: Strapi Deployment on ECS Fargate via GitHub Actions

🛠️ Automation Workflow:
~ Strapi Image Build & Push:

1. Docker builds the image from a custom Dockerfile.

2. The image is tagged and pushed to Amazon ECR via GitHub Actions. This is the CI part. ci_task6.yml

~ Terraform Provisioning:

GitHub Actions triggers terraform init, plan, and apply.

It provisions:

1. VPC, subnets, security groups

2. ALB with target group and listener

3. ECS Cluster and Fargate Task Definition

4. ECS Service with Load Balancer integration

~ Environment Management:

Secrets like APP_KEYS, APP_URL, and ALLOWED_HOSTS are passed via Terraform variables and injected into the ECS task.

🔐 Security & Best Practices:
1. Uses IAM roles and policies (e.g., ecsTaskExecutionRole).

2. Secrets managed via GitHub Secrets and environment variables.

3. Terraform backend kept was local. 
