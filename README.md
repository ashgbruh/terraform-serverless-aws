# Provision Serverless infrastructure using Terraform on AWS

Please export your AWS envrionment variables
```
export AWS_ACCESS_KEY_ID=**************
export AWS_SECRET_ACCESS_KEY=******************
export AWS_DEFAULT_REGION=eu-west-1
export AWS_ACCOUNT_ID=***************
```
The steps below assumes the prereqs have been installed.

Run the command ```make deploy``` from the root - This will spin up the serverless environment.

## CI

## Please export your AWS credentials in Github Secrets in order to run the CI jobs.

GitHub actions jobs in place that deploys a serverless infastructure in nonprod on Pull Request and to Prod on Merge to the Master branch ( Prod config needs to be replicated)
