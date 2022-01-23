# Script requires GNU make
# Install dependencies for running tests and accessing resources

.DEFAULT_GOAL := help
SHELL := /bin/bash
TERRAFORM_VERSION ?= 0.12.26
export TERRAFORM_VERSION

BREWLIST := $(shell brew list)

## Run brew update
update:
	brew update

## Install aws-azure-login
aws-azure-login:
	@echo installing aws-azure-login;
	@if [[ ! "$(BREWLIST)" =~ "node " ]]; then brew install node; fi
	@npm list -g aws-azure-login || npm install -g aws-azure-login

## Install terraform via brew & tfenv
terraform:
	@if [[ ! "$(BREWLIST)" =~ "tfenv " ]]; then brew install tfenv; fi
	@if command -v terraform >/dev/null 2>&1; then \
		if [[ "$(shell tfenv list)" =~ "${TERRAFORM_VERSION}" ]]; then \
			echo "Terraform ${TERRAFORM_VERSION} already installed"; \
		fi \
	else \
		tfenv install ${TERRAFORM_VERSION}; \
		tfenv use ${TERRAFORM_VERSION}; \
	fi

## Install repository dependencies
deps:
	@echo installing dependencies via brew;
	@if [[ ! "$(BREWLIST)" =~ "terraform-docs " ]]; then brew install terraform-docs; fi
	@if [[ ! "$(BREWLIST)" =~ "tflint " ]]; then brew install tflint; fi
	@if [[ ! "$(BREWLIST)" =~ "pre-commit " ]]; then brew install pre-commit; pre-commit install; fi

## Install all Digital PaaS dependencies
install: update deps terraform aws-azure-login

## See all the Makefile targets
help:
		@awk -v skip=1 \
			'/^##/ { sub(/^[#[:blank:]]*/, "", $$0); doc_h=$$0; doc=""; skip=0; next } \
			 skip  { next } \
			 /^#/  { doc=doc "\n" substr($$0, 2); next } \
			 /:/   { sub(/:.*/, "", $$0); printf "\033[34m%-30s\033[0m\033[1m%s\033[0m %s\n", $$0, doc_h, doc; skip=1 }' \
			$(MAKEFILE_LIST)

.PHONY: aws-azure-login deps install terraform update
.PHONY: help
