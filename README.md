# Terraform Tutorials

Day-to-day Terraform notes.

## Day 1 - Understanding Terraform Installation and Lifecycle

```text
my-terraform-project/
├── .terraform/            # Auto-generated: Holds downloaded provider plugins (Git ignored)
├── .terraform.lock.hcl    # Auto-generated: Locks specific provider versions for consistency and security
├── main.tf                # Core infrastructure resources (VPCs, EC2 instances, Security Groups)
├── providers.tf           # Provider configuration and authentication
├── variables.tf           # Input variable definitions
├── outputs.tf             # Output values displayed after execution
├── terraform.tfvars       # Variable values (e.g., region = "us-east-1")
├── .gitignore             # Excludes state files, plugins, and sensitive files
└── terraform.tfstate      # Auto-generated: Current infrastructure state (Git ignored)
```
