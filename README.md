# Terraform Tutorials

Day-to-day Terraform learning notes and hands-on practice.

---

## Day 1 - Understanding Terraform Installation and Lifecycle

Learned the basic Terraform project structure and the Terraform workflow (`init`, `plan`, `apply`, and `destroy`).

```text
my-terraform-project/
├── .terraform/            # Auto-generated: Holds downloaded provider plugins (Git ignored)
├── .terraform.lock.hcl    # Auto-generated: Locks provider versions
├── main.tf                # Core infrastructure resources
├── providers.tf           # Provider configuration
├── variables.tf           # Input variable definitions
├── outputs.tf             # Output values
├── terraform.tfvars       # Variable values
├── .gitignore             # Ignores state files and sensitive files
└── terraform.tfstate      # Auto-generated state file (Git ignored)
```

---

## Day 2 - Connecting Terraform with AWS

Today I connected Terraform to my AWS account and successfully tested the setup.

### What I learned
- Configured the AWS provider.
- Set up AWS credentials for Terraform.
- Initialized the Terraform project using `terraform init`.
- Verified the AWS provider connection.
- Understood how Terraform communicates with AWS services.

### Commands Used

```bash
terraform init
terraform plan
terraform apply
terraform apply -auto-approve
terraform destroy
terraform destroy -auto-approve
```

### Outcome

✅ Successfully connected Terraform to AWS and completed my first hands-on Terraform setup with AWS.

## Day 3 - Understanding Terraform State File

Today I learned how Terraform uses the **state file (`terraform.tfstate`)** to track and manage infrastructure resources.

### What I Learned

* Terraform state maps Terraform configuration to actual AWS resources.
* `terraform.tfstate` stores information about resources managed by Terraform.
* `terraform state list` shows all resources tracked in the state.
* `terraform state show <resource>` displays details of a specific resource.
* Manually changing or deleting resources in AWS creates **infrastructure drift**.
* `terraform plan` detects drift and proposes the required changes, but does not persist refreshed state to the local state file.
* `terraform plan -refresh-only` previews state changes based on actual AWS infrastructure.
* `terraform apply -refresh-only` updates the state to match actual infrastructure without recreating resources.
* A normal `terraform apply` recreates a manually deleted resource if it still exists in the Terraform configuration.

### Hands-On Experiment

1. Created an EC2 instance using Terraform.
2. Verified it using:

```bash
terraform state list
terraform state show aws_instance.web_server
```

3. Manually terminated the EC2 instance from AWS.
4. Ran:

```bash
terraform plan
```

Terraform detected the drift and proposed recreating the EC2 instance.

5. Updated only the state using:

```bash
terraform plan -refresh-only
terraform apply -refresh-only
```

### Key Concept

```text
Configuration → What I WANT
State         → What Terraform TRACKS
AWS           → What ACTUALLY EXISTS
```

### Outcome

✅ Understood Terraform state, infrastructure drift, state refresh, and how Terraform detects manually deleted AWS resources.

## Day 4 - Remote State and State Locking

Configured Terraform to use an **Amazon S3 backend** for remote state storage and enabled **state locking** to prevent concurrent infrastructure changes.

### What I Learned

* Configured an S3 backend for storing the Terraform state file remotely.
* Enabled state locking using DynamoDB.
* Understood the benefits of remote state for team collaboration.
* Learned the difference between `terraform init`, `terraform init -reconfigure`, and `terraform init -migrate-state`.
* Verified that Terraform stores and manages state in the remote backend.

### Commands Used

```bash
terraform init
terraform init -reconfigure
terraform init -migrate-state
terraform plan
terraform apply
terraform destroy
terraform state list
terraform state show <resource_name>
```

### Outcome

✅ Successfully configured remote state with Amazon S3, enabled state locking, and learned how to initialize, reconfigure, and migrate Terraform backends.

