## End to End MAchine Learning Project deployment using ECS and GITHUB Actions:

## Docker and AWS CLI installtion on EC2 instance:

$ sudo apt-get update && sudo apt-get upgrade -y

$ curl -fsSL https://get.docker.com -o get-docker.sh

$ sudo sh get-docker.sh

$ sudo usermod -aG docker ubuntu

$ sudo chmod 777 /var/run/docker.sock

$ newgrp docker

## Installation of AWS CLI on EC2 instance:

$ sudo apt update

$ sudo apt install awscli -y

$ aws configure     #(using this cmd add security credentials and region name)

## Push commands for studentperformance ECR repository:

$ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 705334715992.dkr.ecr.us-east-1.amazonaws.com

$ docker build -t studentperformance .

$ docker tag studentperformance:latest 705334715992.dkr.ecr.us-east-1.amazonaws.com/studentperformance:latest

$ docker push 705334715992.dkr.ecr.us-east-1.amazonaws.com/studentperformance:latest

## Configure EC2 as self-hosted runner:

$ 

$ 

## Setup github secrets:

AWS_ACCESS_KEY_ID= copy and paste access ID

AWS_SECRET_ACCESS_KEY= copy and paste secret access key

AWS_REGION = us-east-1

AWS_ECR_LOGIN_URI = 705334715992.dkr.ecr.us-east-1.amazonaws.com

ECR_REPOSITORY_NAME = studentperformance
