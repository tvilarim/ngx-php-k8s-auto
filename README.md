🚀 Automated Cloud-Native Deployment (AWS + Kubernetes)

This project demonstrates a complete DevOps CI/CD pipeline that automatically delivers a web application from your local computer to the cloud.

It is designed to be cost-effective (using AWS Free Tier or low-cost credits) while using industry-standard tools like Kubernetes and Docker.

🏗 Architecture

Here is the flow of the automation:

Code: You push changes (e.g., index.php) to GitHub.

CI (Build): GitHub Actions wakes up, builds a Docker container, and pushes it to AWS ECR Public (a global image registry).

CD (Deploy): The pipeline connects to your AWS EC2 Server via SSH.

Orchestration: It commands K3s (Lightweight Kubernetes) to pull the new image and update the live website with zero downtime.

🛠 Tech Stack

Cloud Provider: AWS (EC2 & ECR Public)

Orchestration: K3s (Kubernetes optimized for small servers)

Container: Docker (Nginx + PHP-FPM)

Automation: GitHub Actions (YAML)

Networking: Kubernetes Ingress & Services

📋 Prerequisites

To run this yourself, you need:

AWS Account: An active account (Free Tier works with t2.micro, but t3.small is recommended for performance).

GitHub Repository: To host this code and run the Actions.

4 GitHub Secrets:

AWS_ACCESS_KEY_ID: IAM User Key.

AWS_SECRET_ACCESS_KEY: IAM User Secret.

EC2_HOST: The Public IP of your EC2 server.

EC2_SSH_KEY: The .pem private key content to log into the server.

🚀 How to Run

Launch EC2: Start an Ubuntu instance on AWS (t3.small recommended).

Install K3s: SSH into it and run curl -sfL https://get.k3s.io | sh -.

Set Secrets: Add the 4 secrets listed above to your GitHub Repo settings.

Push: Make a change to index.php and commit. The site updates automatically!

📂 Project Structure

.github/workflows/deploy.yml: The brain of the operation. Contains the pipeline logic.

Dockerfile: Instructions on how to package the app (PHP + Nginx).

nginx.conf: Server configuration.

index.php: The actual application code.

Created for learning CI/CD pipelines on AWS.