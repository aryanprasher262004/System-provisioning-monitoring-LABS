# System Provisioning & Monitoring Labs

#ALL THE LABS ARE DONE IN MacOS COMMANDS MAY VARY ACCORDING TO THE OS 

This repository contains practical laboratory experiments completed as part of the **System Provisioning and Monitoring** coursework.

The repository documents hands-on work with **Infrastructure as Code (IaC), Terraform, AWS, cloud infrastructure, automation, provisioning, networking, monitoring, and related DevOps concepts**.

Each experiment is maintained in a separate directory with its own source code, configuration files, diagrams, and detailed documentation.

---

## Repository Structure

```text
System-provisioning-monitoring-LABS/
│
├── exp1-iac-basics/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
│
├── terraform-exp2/
│   ├── modules/
│   │   ├── network/
│   │   └── compute/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   ├── terraform.tfvars.example
│   ├── dependency-graph.dot
│   ├── dependency-graph.png
│   ├── topology.png
│   └── README.md
│
├── future-experiments/
│   └── ...
│
├── .gitignore
└── README.md
```

> The repository structure will continue to grow as new laboratory experiments are completed.

---

# Laboratory Experiments

## Experiment 1 — Infrastructure as Code Basics

**Directory:** `exp1-iac-basics/`

### Objective

Introduction to **Infrastructure as Code using Terraform** and provisioning an **Amazon EC2 instance on AWS**.

### Topics Covered

- Infrastructure as Code
- Terraform basics
- Terraform configuration files
- AWS Provider
- EC2 provisioning
- Terraform variables
- Terraform outputs
- Terraform state
- Terraform lifecycle

### Terraform Workflow

```text
terraform init
      ↓
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
      ↓
AWS EC2 Instance
      ↓
terraform destroy
```

Detailed instructions and implementation are available inside:

```text
exp1-iac-basics/README.md
```

---

## Experiment 2 — Modular AWS Infrastructure using Terraform

**Directory:** `terraform-exp2/`

### Objective

Build a modular AWS infrastructure using Terraform consisting of a **VPC, public/private subnets, Internet Gateway, routing, security groups, web EC2 instances, and a database EC2 instance**.

### Topics Covered

- Terraform modules
- AWS VPC
- Public and private subnets
- Internet Gateway
- Route tables
- Security groups
- EC2 instances
- Multi-tier architecture
- Module inputs and outputs
- Resource dependencies
- Terraform dependency graph
- Graphviz

### Architecture

The experiment follows a basic two-tier architecture:

```text
                    Internet
                       |
                Internet Gateway
                       |
                Public Route Table
                       |
              +------------------+
              |       VPC        |
              |   10.0.0.0/16   |
              |                  |
              |  Public Subnet   |
              |   10.0.1.0/24   |
              |                  |
              |  Web-1    Web-2  |
              |    \       /     |
              |     WEB SG       |
              |        |         |
              |     TCP 3306     |
              |        |         |
              | Private Subnet   |
              |  10.0.2.0/24    |
              |        |         |
              |   Database EC2   |
              |      DB SG       |
              +------------------+
```

Detailed instructions, architecture diagrams, Terraform configuration, and dependency graph are available inside:

```text
terraform-exp2/README.md
```

---

# Technologies and Tools

The laboratory experiments in this repository may use the following technologies:

| Technology | Purpose |
|---|---|
| Terraform | Infrastructure as Code and provisioning |
| AWS | Cloud infrastructure platform |
| AWS EC2 | Virtual machine provisioning |
| AWS VPC | Cloud networking |
| AWS CLI | Command-line interaction with AWS |
| Graphviz | Terraform dependency graph visualization |
| Git | Version control |
| GitHub | Source code and lab documentation |
| VS Code | Development and configuration editing |

Additional tools will be added as future experiments are completed.

---

# Prerequisites

Depending on the experiment, some or all of the following may be required:

- Terraform
- AWS CLI
- Git
- Graphviz
- AWS Account
- VS Code or another code editor
- Terminal / Shell

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

Check Graphviz:

```bash
dot -V
```

---

# AWS Configuration

For experiments using AWS, configure the AWS CLI:

```bash
aws configure
```

Verify the configured identity:

```bash
aws sts get-caller-identity
```

AWS credentials and secret keys should **never be committed to this repository**.

---

# General Terraform Workflow

Most Terraform experiments in this repository follow the standard workflow below.

## 1. Initialize

```bash
terraform init
```

Downloads providers and initializes the Terraform working directory.

## 2. Format

```bash
terraform fmt -recursive
```

Formats Terraform configuration files.

## 3. Validate

```bash
terraform validate
```

Checks the Terraform configuration.

## 4. Plan

```bash
terraform plan
```

Displays the infrastructure changes Terraform intends to make.

A plan can also be saved:

```bash
terraform plan -out=tfplan
```

## 5. Apply

```bash
terraform apply
```

or:

```bash
terraform apply tfplan
```

Creates or modifies the infrastructure.

## 6. View Outputs

```bash
terraform output
```

## 7. View Managed Resources

```bash
terraform state list
```

## 8. Destroy

```bash
terraform destroy
```

Removes the infrastructure managed by Terraform.

---

# Repository Guidelines

Each laboratory experiment should preferably have its own directory.

Example:

```text
exp3-<experiment-name>/
├── main.tf
├── variables.tf
├── outputs.tf
├── README.md
└── ...
```

Each experiment README should document:

1. Aim
2. Objectives
3. Prerequisites
4. Architecture or design
5. Project structure
6. Configuration
7. Commands used
8. Implementation steps
9. Verification
10. Screenshots or diagrams, where applicable
11. Result
12. Key learnings

This keeps each experiment independent and easy to reproduce.

---

# Repository Safety

Some Terraform-generated files may contain sensitive information or should not be stored in Git.

The root `.gitignore` should include:

```gitignore
# Terraform working directories
**/.terraform/*

# Terraform state
*.tfstate
*.tfstate.*

# Terraform plan files
tfplan
*.tfplan

# Variable files
*.tfvars
*.tfvars.json

# Keep example variable files
!*.tfvars.example

# Terraform crash logs
crash.log
crash.*.log

# macOS
.DS_Store
```

### Files that can normally be committed

```text
*.tf
.terraform.lock.hcl
terraform.tfvars.example
README.md
*.png
*.dot
```

### Files that should normally not be committed

```text
.terraform/
terraform.tfstate
terraform.tfstate.backup
terraform.tfvars
tfplan
.DS_Store
```

---

# Git Workflow

After completing or updating an experiment:

```bash
git status
```

Stage the changes:

```bash
git add .
```

Commit:

```bash
git commit -m "Add experiment documentation"
```

Push to GitHub:

```bash
git push
```

---

# Future Experiments

This repository will be continuously updated with additional laboratory experiments related to:

- Infrastructure as Code
- Terraform
- AWS
- Cloud provisioning
- Configuration management
- Infrastructure automation
- System monitoring
- DevOps tools and practices
- Cloud networking
- Infrastructure security

The exact experiments and technologies will be added according to the university laboratory coursework.

---

# Learning Outcomes

Through these laboratory experiments, the goal is to develop practical experience in:

- Automating infrastructure provisioning
- Managing cloud resources using code
- Designing cloud network architectures
- Using reusable infrastructure modules
- Applying infrastructure security practices
- Understanding infrastructure dependencies
- Using version control for infrastructure code
- Managing infrastructure throughout its lifecycle
- Working with modern provisioning and monitoring tools

---

# Disclaimer

The configurations in this repository are created for **educational and laboratory purposes**.

Cloud resources may result in charges depending on the services and instance types used. Resources should be destroyed after completing experiments when they are no longer required.

Never commit AWS credentials, private keys, passwords, Terraform state files, or other sensitive information to the repository.
