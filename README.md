# Employee Management System (EMS)

## Overview
This project is an **Employee Management System (EMS)** web application built using Django. It allows you to manage employee information, including adding, viewing, and updating employee records.  

The project also includes a **complete CI/CD pipeline** using Jenkins and **infrastructure provisioning** using Terraform on AWS. Docker is used for containerization, and Nginx is used as a reverse proxy.

---

## Project Structure

```
ems/
├── employee_information/ # Django app for employee management
├── infra/ # Terraform infrastructure code
├── myenv/ # Python virtual environment
├── nginx/ # Nginx Docker setup
├── static/employee_information/assets
├── .dockerignore
├── Dockerfile # Dockerfile for app
├── docker-compose.yml
├── Jenkinsfile # CI/CD pipeline definition
├── manage.py
├── requirements.txt
├── db.sqlite3
└── README.md 
```

## Step 1: Infrastructure Setup (Terraform)
Terraform is used to create the required AWS infrastructure before deploying the application.

**Steps:**
1. Navigate to the `infra` directory:
```
cd infra
```
2. Open the Terraform variable file (or main.tf) and update the values as needed.....:

   Region: Change the default AWS region if required (e.g., ap-south-1).
   AMI ID: Update the ami variable to match the desired OS image in your region.
   Instance type, volume size, volume type: Update as needed for your instance.

3. Leave all other resources as default:

   VPC, Subnet, Internet Gateway, Security Groups, Route Tables, etc.
  All resources are automatically named starting with session (e.g., session-vpc, session-instance).

4. Initialize Terraform:
```
terraform init
```
5. Validate the configuration:
```
terraform validate
```
6. Plan the infrastructure:
```
terrafrom plan
```
7. Apply the configuration to create resources:
```
terraform apply
```
## Step 2: Jenkins Agent Setup
An EC2 instance is configured as a Jenkins agent to run pipeline stages.

Steps:...
1. Generate an SSH key on the Jenkins master machine:
```
ssh-keygen -t rsa -b 4096 -C "jenkins@ec2"
```
2. Copy the public key to the EC2 agent’s ~/.ssh/authorized_keys.
  
3. Add the private key to Jenkins Credentials:

   Kind: SSH Username with private key

   Username: ubuntu (EC2 user)

   ID: ec2-ssh-key

4. Configure the Jenkins node:

   Name: ec2_agent

   Remote root directory: /home/ubuntu

   Labels: ec2_agent

   Launch method: Launch agents via SSH

   Host: EC2 public IP   

   Credentials: ec2-ssh-key

## Step 3: Jenkins Pipeline Setup

The Jenkins pipeline automates code clone, Docker build, security scan, image push, and container deployment.

Pipeline Stages:

Code Clone: Pulls the latest code from GitHub.

Install Tools: Installs Docker and Trivy (for security scanning) on the agent.

Build Docker Image: Builds Docker image for the Django app.

Image Scan: Scans the image with Trivy for vulnerabilities.

Push Docker Image: Pushes the image to DockerHub with dynamic tags:

  app:latest

  app:build-<BUILD_NUMBER>

Network Create: Creates a Docker network for app and Nginx containers.

Container Create: Runs the Django application container.

Nginx Config: Builds and runs Nginx container to serve the app.

## Step 4: Webhook Integration

GitHub webhook is configured to automatically trigger the Jenkins pipeline on every push to the repository.

Webhook URL: https://public-ip/github-webhook/

Events: Push events

Verification: Webhook POST requests are received by Jenkins and trigger the pipeline.

## Step 5: Running the Application

After the pipeline completes, the Django app will be running in a Docker container:

App port: 8000

Nginx port: 80

Access the app via your EC2 public IP (through Nginx):
```
http://<EC2_PUBLIC_IP>/
```

## Notes....!
Ensure SSH access from Jenkins master to EC2 agent is working before running the pipeline.

Update DockerHub credentials in Jenkins for pushing images.

This setup is for learning and hands-on practice. 

Production deployment may require additional security, monitoring, and scaling considerations.


