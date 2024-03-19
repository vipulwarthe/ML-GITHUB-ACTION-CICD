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

## Create ECR repo and use Push commands for studentperformance ECR repository:

$ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 705334715992.dkr.ecr.us-east-1.amazonaws.com

$ docker build -t studentperformance .

$ docker tag studentperformance:latest 705334715992.dkr.ecr.us-east-1.amazonaws.com/studentperformance:latest

$ docker push 705334715992.dkr.ecr.us-east-1.amazonaws.com/studentperformance:latest

## Configure EC2 as self-hosted runner:

## Create a folder
$ mkdir actions-runner && cd actions-runner

## Download the latest runner package
$ curl -o actions-runner-linux-x64-2.314.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.314.1/actions-runner-linux-x64-2.314.1.tar.gz

## Optional: Validate the hash
$ echo "6c726a118bbe02cd32e222f890e1e476567bf299353a96886ba75b423c1137b5  actions-runner-linux-x64-2.314.1.tar.gz" | shasum -a 256 -c

## Extract the installer
$ tar xzf ./actions-runner-linux-x64-2.314.1.tar.gz

## Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/vipulwarthe/AWS-CI-CD-Projects --token A6IS6TVNALP6OIKCTJDJI6LF7FPKU

## Last step, run it!
$ ./run.sh

## Setup github secrets:

AWS_ACCESS_KEY_ID= copy and paste access ID

AWS_SECRET_ACCESS_KEY= copy and paste secret access key

AWS_REGION = us-east-1

AWS_ECR_LOGIN_URI = 705334715992.dkr.ecr.us-east-1.amazonaws.com

ECR_REPOSITORY_NAME = studentperformance

Try to make some changes in your github repo code and you will see github actions will run automatically CI/CD pipeline.

Last step is to check in your browser with your pubic IP along with port, you will see your application is running...

https://172.31.50.170:8080/predictdata
