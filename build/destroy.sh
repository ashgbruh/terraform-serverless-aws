#!/bin/bash

cd terraform/nonprod/api_gateway
terragrunt destroy -auto-approve
cd ../lambda
terragrunt destroy -auto-approve
cd ../dynamodb
terragrunt destroy -auto-approve
