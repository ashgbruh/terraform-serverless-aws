#!/bin/bash

cd terraform/prod/dynamodb
terragrunt apply -auto-approve
cd ../lambda
terragrunt apply -auto-approve
cd ../api_gateway
terragrunt apply -auto-approve
