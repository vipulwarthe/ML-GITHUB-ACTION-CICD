## End to End MAchine Learning Project deployment using EC2, ECR, ECS, Docker and GITHUB Actions:

## Install Docker on EC2 instance:

$ sudo apt-get update && sudo apt-get upgrade -y

$ curl -fsSL https://get.docker.com -o get-docker.sh

$ sudo sh get-docker.sh

$ sudo usermod -aG docker ubuntu

$ sudo chmod 777 /var/run/docker.sock

$ newgrp docker

$ docker               (use cmd to check the docker is installed)

## Install AWS CLI on EC2 instance:

$ sudo apt update

$ sudo apt install awscli -y

$ aws configure        (using this cmd add security credentials and region name)

## Create ECR repo and use Push commands for studentperformance ECR repository:

$ aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 705334715992.dkr.ecr.us-east-1.amazonaws.com

$ docker build -t studentperformance .

$ docker tag studentperformance:latest 705334715992.dkr.ecr.us-east-1.amazonaws.com/studentperformance:latest

$ docker push 705334715992.dkr.ecr.us-east-1.amazonaws.com/studentperformance:latest

## Configure EC2 as self-hosted runner:

## go to the github repo(AWS CICD projects) setting and click on actions-Runners-New self hosted runner

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

* when you run above command you will put some values like-
  
* Enter the name of the runner group to add this runner to : Enter(default)
* Enter the name of the runner : self-hosted
* Enter any additional label : [press Enter to skip]
* Enter name of work folder : [Press Enter]
* All setup is done

## Last step, run it!
$ ./run.sh

## Setup github secrets:

* go to the github repo - security - secrets and variables - Actions 

AWS_ACCESS_KEY_ID= copy and paste access ID

AWS_SECRET_ACCESS_KEY= copy and paste secret access key

AWS_REGION = us-east-1

AWS_ECR_LOGIN_URI = 705334715992.dkr.ecr.us-east-1.amazonaws.com

ECR_REPOSITORY_NAME = studentperformance

Try to make some changes in your github repo code and you will see github actions will run automatically CI/CD pipeline.

Last step is to check in your browser with your pubic IP along with port, you will see your application is running...

https://172.31.50.170:8080/predictdata
