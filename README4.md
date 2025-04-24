TASK: 7 - Deploy a Strapi application on AWS using ECS Fargate, managed entirely via Terraform and Automate via Github Actions [ci/cd] and Add CloudWatch for Monitoring (Logging & Metrics)

🔧 Overview
This task focuses on deploying a Strapi application on Amazon ECS Fargate, utilizing Infrastructure as Code (IaC) with Terraform, and automating the deployment workflow via GitHub Actions (CI/CD pipeline). Additionally, Amazon CloudWatch is integrated for real-time monitoring of application logs and performance metrics.

🛠️ Key Components
1. Infrastructure as Code with Terraform
Terraform is used to provision and manage:

-VPC, Subnets, and Security Groups

-ECS Cluster

-Fargate Task Definitions

-ECS Services (Load-balanced)

-CloudWatch Log Groups and Alarms

2. ECS & Fargate Setup
   
-A Strapi container image is pulled from Amazon ECR

-Deployed as an ECS Fargate task behind an Application Load Balancer (ALB)

-Environment variables are injected securely through Terraform

-The service is exposed on port 1337 for the Strapi Admin UI

🚀 Continuous Deployment with GitHub Actions

-A GitHub Actions CI/CD pipeline automates:

-Docker image build and push to ECR

-Terraform plan and apply for infrastructure changes

-Secret management using GitHub Secrets (AWS credentials, keys)

-This enables seamless deployment on each push to the main branch

📊 CloudWatch Integration

a. CloudWatch Log Group

-Terraform provisions a Log Group: /ecs/strapi

-The ECS task definition uses the awslogs driver to stream container logs

-Log Streams follow the format: /ecs/strapi/strapi/<task-id>

-This allows for real-time troubleshooting and error tracking

b. CloudWatch Metrics Monitored

-ECS service metrics automatically collected:

-CPUUtilization

-MemoryUtilization

-TaskCount

-NetworkIn / NetworkOut

c. CloudWatch Alarms:


-Alert if CPU > 75% 

-CloudWatch marks the alarm state as ALARM

-Trigger auto-recovery or autoscaling

-Monitor for failed deployments or unhealthy containers

![image](https://github.com/user-attachments/assets/f8209eb2-0dbf-4eb9-9cc5-cb915b8c5592)

![image](https://github.com/user-attachments/assets/d4002398-6cc3-40e0-9e76-d36a255be250)

![image](https://github.com/user-attachments/assets/ba42df6b-6717-4c56-ac17-3e06ed159d73)

![image](https://github.com/user-attachments/assets/75761d76-dab3-4373-9639-60a14a435c42)



