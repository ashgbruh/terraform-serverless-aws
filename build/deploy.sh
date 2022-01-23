#!/bin/bash

cd terraform/nonprod/dynamodb
terragrunt apply -auto-approve
cd ../lambda
terragrunt apply -auto-approve
cd ../api_gateway
terragrunt apply -auto-approve
