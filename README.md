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
```

### Outcome

✅ Successfully connected Terraform to AWS and completed my first hands-on Terraform setup with AWS.