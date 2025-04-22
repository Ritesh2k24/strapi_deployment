Automate Strapi Deployment with GitHub Actions + Terraform

🚀 Strapi Deployment using GitHub Actions, Terraform, DockerHub & Ec2 Instance

This project automates the deployment of a Strapi CMS application on an AWS EC2 instance using:

Docker to containerize the application

DockerHub to store the Docker image

Terraform to provision infrastructure

GitHub Actions to build, push, and deploy via CI/CD

⚙️ How it Works

CI Workflow (ci.yml)
-Triggers on push to main branch

-Builds the Docker image for the Strapi app

-Pushes it to DockerHub

CD Workflow (terraform.yml)
-Triggered manually (workflow_dispatch)

-Runs terraform init, plan, and apply

-Launches an EC2 instance with Docker

-Pulls the latest Strapi image from DockerHub and runs it



![image](https://github.com/user-attachments/assets/e4abd220-993b-441a-9f94-a16e64cad73f)


![image](https://github.com/user-attachments/assets/90be62aa-ec00-4d0e-970b-6960ab247578)
