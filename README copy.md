# Provisioning ECS Fargate to host the Checkout DevOps challenge Website.

## How to create the infrastructure?

Please export your AWS credentials
```export AWS_ACCESS_KEY_ID=**************
export AWS_SECRET_ACCESS_KEY=******************
export AWS_DEFAULT_REGION=eu-west-1
export AWS_ACCOUNT_ID=***************
```
The steps below assumes the prereqs have been installed.

Run the command ```make deploy``` from the root - This will spin up the environment.

This can take upto 5 minutes to bring the AWS infrastructure up and running.
The above will deploy a highly Scalable ECS Fargate that hosts a website running on a nginx server.

## to tear down the infrastrcuture after you are done

run the command ```make destroy```
