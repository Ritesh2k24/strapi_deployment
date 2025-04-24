🚀 TASK 5 : Deployment of strapi on ecs with Terraform 
1. Pushing Docker Image to Amazon ECR
Docker Image Name: strapi_task5

Steps Taken:

Created a repository in ECR.

Logged in to ECR via CLI using:

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-east-1.amazonaws.com

Tagged the local image:

docker tag strapi_task5:latest <account-id>.dkr.ecr.us-east-1.amazonaws.com/strapi_task5:latest

Pushed to ECR:

docker push <account-id>.dkr.ecr.us-east-1.amazonaws.com/strapi_task5:latest


2. Terraform Configuration for ECS Deployment
✅ VPC & Subnet Setup (vpc.tf)
Created a custom VPC.

Created two public subnets across different AZs.

Associated an Internet Gateway and Route Table for public internet access.

✅ Security Group
Opened port 1337 for Strapi access.

Allowed all egress traffic.

✅ Application Load Balancer (alb.tf)
ALB listens on port 80, forwards to ECS container on port 1337.

Target group health check path: /.

✅ ECS Cluster & Task Definition (ecs.tf)
Created an ECS cluster strapi-cluster.

Task Definition:

Network Mode: awsvpc

CPU/MEM: 512/1024

Execution Role: arn:aws:iam::<your-id>:role/ecsTaskExecutionRole

Container: Fetched image from ECR

Environment variables:

HOST, PORT, APP_KEYS, ADMIN_JWT_SECRET, ALLOWED_HOSTS

ECS Service:

Launch type: Fargate

Load Balancer integrated

Public IP assigned


![image](https://github.com/user-attachments/assets/e86e4bcf-6756-4e9c-ad91-dfef6d5735f3)

