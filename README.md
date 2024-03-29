# Secure Infrastructure Deployment with Terraform and GitHub Actions

This repository contains a demonstration of securely deploying infrastructure to Google Cloud Platform (GCP) using Terraform and GitHub Actions. The infrastructure deployment process is divided into two main stages: planning and applying.

## Workflow Overview

The workflow consists of three main YAML files:

1. **terraform-plan.yml**: This YAML file defines the workflow for planning the Terraform changes. It performs the following steps:
   - Checks out the repository
   - Runs TFSec for IaC scans and code quality checks (optional)
   - Sets up Terraform and initializes the backend
   - Validates the Terraform configuration
   - Generates a Terraform plan and stores it as an artifact

2. **terraform-apply.yml**: This YAML file defines the workflow for applying the Terraform changes. It depends on the output generated by the `terraform-plan.yml` workflow. It performs the following steps:
   - Checks out the repository
   - Downloads the Terraform plan artifact generated in the planning stage
   - Sets up Terraform and initializes the backend
   - Applies the Terraform plan to deploy the infrastructure

3. **pipeline.yml**: This YAML file orchestrates the overall workflow by invoking the `terraform-plan.yml` and `terraform-apply.yml` workflows based on triggers such as push events to the main branch or pull requests. It contains two main jobs:
   - **Dev_Plan**: Triggers the planning workflow. It defines inputs such as Terraform version, GCP backend bucket details, Terraform variables file, and enables TFSec for IaC scans.
   - **Dev_Deploy**: Triggers the deployment workflow. It depends on the output of the planning job and defines similar inputs for Terraform version, GCP backend bucket details, and Terraform variables file.

## Usage

To use this repository for deploying infrastructure to GCP securely, follow these steps:

1. Ensure you have the necessary permissions and secrets set up in your GitHub repository. This includes:
   - Setting up a Google Cloud service account with appropriate permissions and storing its JSON key as a secret in your GitHub repository.
   - Granting necessary permissions for accessing the repository contents and secrets.

2. Customize the Terraform configurations (`*.tf` files) and variables (`*.tfvars` files) according to your infrastructure requirements.

3. Adjust the workflow configurations in the `.github/workflows` directory if needed, such as specifying different backend bucket names or paths.

4. Trigger the workflow by pushing changes to the main branch or creating pull requests, depending on the configured triggers.

5. Monitor the workflow execution in the GitHub Actions tab to ensure successful planning and deployment of infrastructure changes.

## Notes

- Ensure that Terraform and required plugins are installed and available in the environment where GitHub Actions workflows will run.
- Review and customize the Terraform configurations and workflows according to your security and infrastructure requirements.
- Monitor the workflow runs for any errors or warnings and troubleshoot as needed.
