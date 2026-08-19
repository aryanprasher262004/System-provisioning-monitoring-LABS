# Experiment 1: Infrastructure as Code Basics using Terraform and AWS

## 1. Aim

To understand the basics of **Infrastructure as Code (IaC)** using Terraform and use Terraform to provision and manage an **Amazon EC2 instance on AWS**.

---

## 2. Objectives

The objectives of this experiment are:

- Understand the concept of Infrastructure as Code.
- Install and configure Terraform.
- Configure AWS credentials for Terraform.
- Understand the basic structure of Terraform configuration files.
- Configure the AWS provider.
- Create an EC2 instance using Terraform.
- Use Terraform variables to make the configuration reusable.
- Use Terraform outputs to display resource information.
- Understand the Terraform workflow:
  - `terraform init`
  - `terraform fmt`
  - `terraform validate`
  - `terraform plan`
  - `terraform apply`
  - `terraform destroy`
- Understand how Terraform state tracks infrastructure.

---

## 3. What is Infrastructure as Code?

Infrastructure as Code (IaC) is the practice of defining and managing infrastructure using configuration files instead of manually creating resources through a cloud console.

Instead of manually creating an EC2 instance from the AWS Management Console, we describe the required infrastructure in Terraform files.

Terraform then communicates with AWS and creates the resources.

Basic workflow:

```text
Terraform Configuration
        |
        v
Terraform CLI
        |
        v
AWS Provider
        |
        v
AWS API
        |
        v
AWS Infrastructure
```

---

## 4. What is Terraform?

Terraform is an Infrastructure as Code tool developed by HashiCorp.

Terraform uses configuration files written in **HCL (HashiCorp Configuration Language)**.

Terraform allows us to:

- Create infrastructure
- Modify infrastructure
- Track infrastructure
- Destroy infrastructure
- Reproduce the same infrastructure using configuration files

Terraform configuration files normally use the `.tf` extension.

---

## 5. Prerequisites

Before starting the experiment, the following are required:

- AWS account
- Terraform
- AWS CLI
- Git
- Terminal
- Code editor such as VS Code
- AWS credentials with permission to create EC2 resources

Check Terraform:

```bash
terraform --version
```

Check AWS CLI:

```bash
aws --version
```

Check Git:

```bash
git --version
```

---

## 6. Configure AWS CLI

Configure AWS credentials using:

```bash
aws configure
```

Enter the required details:

```text
AWS Access Key ID: <your-access-key>
AWS Secret Access Key: <your-secret-key>
Default region name: <your-region>
Default output format: json
```

Verify that AWS authentication is working:

```bash
aws sts get-caller-identity
```

If authentication is successful, AWS returns information about the currently authenticated identity.

> Do not store AWS access keys or secret keys directly inside Terraform files or commit them to GitHub.

---

## 7. Project Structure

The project is organized as follows:

```text
exp1-iac-basics/
├── .gitignore
├── .terraform.lock.hcl
├── main.tf
├── outputs.tf
├── variables.tf
└── README.md
```

### File Description

| File | Purpose |
|---|---|
| `main.tf` | Contains provider configuration and EC2 resource configuration |
| `variables.tf` | Defines input variables |
| `outputs.tf` | Defines values displayed after Terraform creates resources |
| `.terraform.lock.hcl` | Records the provider versions selected by Terraform |
| `.gitignore` | Prevents generated or sensitive files from being committed |
| `README.md` | Documentation for the experiment |

---

# 8. Step 1 — Create the Project Directory

Create a directory for the experiment:

```bash
mkdir exp1-iac-basics
```

Enter the directory:

```bash
cd exp1-iac-basics
```

Create the required Terraform files:

```bash
touch main.tf variables.tf outputs.tf
```

Check the files:

```bash
ls
```

---

# 9. Step 2 — Configure the AWS Provider

Terraform communicates with AWS using the AWS provider.

The provider configuration is placed inside `main.tf`.

Example:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
```

The provider tells Terraform that AWS resources will be managed by this configuration.

---

# 10. Step 3 — Define Variables

Variables make Terraform configurations easier to reuse.

Variables are defined inside:

```text
variables.tf
```

Example:

```hcl
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID used for the EC2 instance"
  type        = string
}
```

The exact AMI ID depends on the AWS region being used.

---

# 11. Step 4 — Create the EC2 Resource

The EC2 instance is defined using the `aws_instance` Terraform resource.

Example configuration in `main.tf`:

```hcl
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "terraform-exp1"
  }
}
```

Terraform will use this configuration to create an EC2 instance in AWS.

---

# 12. Step 5 — Configure Outputs

Terraform outputs can display useful information after resources are created.

Add outputs inside:

```text
outputs.tf
```

Example:

```hcl
output "instance_id" {
  description = "ID of the created EC2 instance"
  value       = aws_instance.example.id
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example.public_ip
}
```

---

# 13. Step 6 — Initialize Terraform

Run:

```bash
terraform init
```

Terraform will:

- Initialize the working directory.
- Download the AWS provider.
- Create the `.terraform` directory.
- Create or update `.terraform.lock.hcl`.

A successful initialization displays:

```text
Terraform has been successfully initialized!
```

---

# 14. Step 7 — Format Terraform Files

Run:

```bash
terraform fmt
```

This automatically formats Terraform files.

To format Terraform files recursively:

```bash
terraform fmt -recursive
```

---

# 15. Step 8 — Validate the Configuration

Run:

```bash
terraform validate
```

This checks whether the Terraform configuration is valid.

Expected output:

```text
Success! The configuration is valid.
```

---

# 16. Step 9 — Create an Execution Plan

Run:

```bash
terraform plan
```

Terraform compares the configuration with the current infrastructure and displays the changes it plans to make.

For a new configuration, the output should indicate that an EC2 instance will be created.

Typical summary:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

Always review the plan before applying infrastructure changes.

---

# 17. Step 10 — Apply the Terraform Configuration

Run:

```bash
terraform apply
```

Terraform displays the execution plan and asks for confirmation.

Enter:

```text
yes
```

Terraform then creates the EC2 instance.

After successful creation, Terraform displays:

```text
Apply complete!
```

---

# 18. Step 11 — Verify the EC2 Instance

The created instance can be verified using Terraform:

```bash
terraform state list
```

Example:

```text
aws_instance.example
```

View detailed information:

```bash
terraform show
```

View Terraform outputs:

```bash
terraform output
```

The EC2 instance can also be verified from:

```text
AWS Management Console
→ EC2
→ Instances
```

The instance created by Terraform should appear in the EC2 instances list.

---

# 19. Terraform State

Terraform creates a state file:

```text
terraform.tfstate
```

The state file stores information about the resources currently managed by Terraform.

Useful commands:

```bash
terraform state list
```

and:

```bash
terraform show
```

State files should normally not be committed to a Git repository because they may contain infrastructure details or sensitive information.

---

# 20. Step 12 — Modify Infrastructure

One advantage of Infrastructure as Code is that infrastructure can be changed by editing configuration files.

For example, change a tag:

```hcl
tags = {
  Name = "terraform-updated-instance"
}
```

Run:

```bash
terraform plan
```

Review the proposed change.

Then:

```bash
terraform apply
```

Terraform updates the infrastructure to match the configuration.

---

# 21. Step 13 — Destroy the Infrastructure

After completing the experiment, remove the resources to avoid unnecessary AWS charges.

First preview the destruction:

```bash
terraform plan -destroy
```

Then run:

```bash
terraform destroy
```

Enter:

```text
yes
```

Terraform removes the resources managed by the configuration.

Expected summary:

```text
Destroy complete!
```

---

# 22. Complete Terraform Workflow

The complete workflow followed in this experiment is:

```text
Write Terraform Configuration
            |
            v
     terraform init
            |
            v
     terraform fmt
            |
            v
   terraform validate
            |
            v
     terraform plan
            |
            v
     terraform apply
            |
            v
      AWS EC2 Created
            |
            v
     terraform output
            |
            v
    terraform destroy
```

---

# 23. Important Terraform Commands

| Command | Purpose |
|---|---|
| `terraform init` | Initializes the Terraform directory |
| `terraform fmt` | Formats Terraform files |
| `terraform validate` | Validates the configuration |
| `terraform plan` | Shows proposed infrastructure changes |
| `terraform apply` | Creates or modifies infrastructure |
| `terraform output` | Displays output values |
| `terraform show` | Displays current state information |
| `terraform state list` | Lists resources tracked by Terraform |
| `terraform destroy` | Removes Terraform-managed infrastructure |

---

# 24. Git Ignore Configuration

Terraform generates some files that should not be committed.

Example `.gitignore`:

```gitignore
# Terraform directory
**/.terraform/*

# Terraform state
*.tfstate
*.tfstate.*

# Terraform plans
tfplan
*.tfplan

# Variable files
*.tfvars
*.tfvars.json

# Keep example variable files
!*.tfvars.example

# macOS
.DS_Store
```

The `.terraform.lock.hcl` file can be committed to Git because it records the provider versions selected for the configuration.

---

# 25. Result

Successfully implemented the basics of **Infrastructure as Code using Terraform**.

Terraform was configured with AWS, and an Amazon EC2 instance was provisioned using Terraform configuration files.

The experiment also demonstrated the complete Terraform lifecycle from initialization and planning to resource creation and destruction.

---

# 26. Key Learnings

Through this experiment, we learned:

- The basic concept of Infrastructure as Code.
- How Terraform communicates with AWS using providers.
- How infrastructure is represented using Terraform resources.
- How variables make Terraform configurations reusable.
- How outputs display useful infrastructure information.
- How `terraform plan` previews infrastructure changes.
- How `terraform apply` creates infrastructure.
- How Terraform state tracks managed resources.
- How `terraform destroy` removes infrastructure.
- Why generated state files and sensitive files should not be committed to Git.