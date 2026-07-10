# Terraform Tutorials

Day-to-day Terraform learning notes and hands-on practice.

---

## Day 3 - Understanding Terraform State File

Today I learned how Terraform uses the **state file** to track and manage infrastructure resources.

### What is a Terraform State File?

Terraform stores information about the infrastructure it manages in a file called:

```text
terraform.tfstate
```

The state file acts as a bridge between the **Terraform configuration** and the **actual infrastructure** created in a cloud provider such as AWS.

```text
Terraform Configuration
        ↓
terraform.tfstate
        ↓
AWS Infrastructure
```

Terraform uses the state file to understand:

* Which resources it created and manages.
* Which Terraform resources correspond to real AWS resources.
* The current attributes of managed resources.
* What changes are required during the next `terraform plan` or `terraform apply`.

---

### Why Does Terraform Need State?

Terraform is declarative. We define the desired infrastructure, and Terraform determines the actions required to reach that desired state.

Terraform works with three important layers:

```text
1. Terraform Configuration → What we want
2. Terraform State         → What Terraform tracks
3. Real Infrastructure     → What actually exists in AWS
```

Example:

```text
main.tf
   ↓
"I want one EC2 instance"

terraform.tfstate
   ↓
"Terraform tracks EC2 instance i-0123456789"

AWS
   ↓
"The actual EC2 instance exists"
```

When we run:

```bash
terraform plan
```

Terraform compares the configuration, state, and actual provider information to determine whether resources need to be:

* Created
* Updated
* Replaced
* Destroyed

---

### Important Terraform State Files

After running `terraform apply`, Terraform may create the following files:

```text
terraform.tfstate
terraform.tfstate.backup
```

* `terraform.tfstate` — Contains the current Terraform state.
* `terraform.tfstate.backup` — Contains a backup of the previous state.

Example project structure:

```text
my-terraform-project/
├── .terraform/
├── .terraform.lock.hcl
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── terraform.tfstate
├── terraform.tfstate.backup
└── .gitignore
```

---

### Useful Terraform State Commands

List all resources tracked by Terraform:

```bash
terraform state list
```

Show detailed state information for a specific resource:

```bash
terraform state show <resource-address>
```

Example:

```bash
terraform state show aws_instance.web_server
```

Display the complete Terraform state in a human-readable format:

```bash
terraform show
```

Move or rename a resource within the Terraform state:

```bash
terraform state mv <source> <destination>
```

Remove a resource from Terraform state without deleting the actual cloud resource:

```bash
terraform state rm <resource-address>
```

> **Note:** `terraform state rm` only removes the resource from Terraform's management. The actual resource continues to exist in AWS.

---

### What Happens If the State File Is Deleted?

Deleting `terraform.tfstate` does **not** delete the actual infrastructure from AWS.

Instead, Terraform loses its record of the resources it previously managed.

```text
Before deleting state:

Terraform Code
      ↓
State File
      ↓
AWS Resource

After deleting state:

Terraform Code
      ↓
No State Information

AWS Resource still exists
```

If Terraform no longer tracks an existing resource, it may propose creating a new resource during the next `terraform plan`.

An existing resource can be brought under Terraform management using:

```bash
terraform import
```

Example:

```bash
terraform import aws_instance.web_server i-0123456789abcdef0
```

---

### Local State vs Remote State

By default, Terraform stores the state locally:

```text
terraform.tfstate
```

This is known as **local state** and is suitable for learning and individual experimentation.

For team environments and production infrastructure, **remote state** is preferred.

```text
Developer A ─┐
Developer B ─┼──→ Remote State Backend ───→ AWS Infrastructure
Developer C ─┘
```

Remote state provides centralized state storage and can support features such as state locking, depending on the configured backend.

---

### State Locking

State locking prevents multiple users or processes from modifying the same Terraform state at the same time.

```text
Developer A → Acquires Lock → Runs Apply → Releases Lock
Developer B → Waits         → Runs Apply → Releases Lock
```

This helps prevent state conflicts and corruption in team environments.

---

### Why Should State Files Not Be Committed to Git?

Terraform state files may contain:

* Resource IDs
* IP addresses
* Infrastructure metadata
* Database configuration
* Potentially sensitive values

Therefore, state files should normally be excluded using `.gitignore`:

```gitignore
# Terraform state files
*.tfstate
*.tfstate.*

# Terraform working directory
.terraform/

# Variable files that may contain secrets
*.tfvars
```

The `.terraform.lock.hcl` file should generally be committed to Git because it records provider dependency selections and helps maintain consistent provider versions.

---

### Important Rule

Do not manually edit the `terraform.tfstate` file.

Instead, use Terraform's supported state management commands:

```bash
terraform state list
terraform state show
terraform state mv
terraform state rm
terraform import
```

---

### Hands-On Practice

Run the following commands after creating an AWS resource with Terraform:

```bash
terraform init
terraform plan
terraform apply
```

List resources tracked in the state:

```bash
terraform state list
```

Inspect a specific resource:

```bash
terraform state show <resource-address>
```

View the complete state:

```bash
terraform show
```

Modify one attribute in the Terraform configuration and run:

```bash
terraform plan
```

Observe how Terraform detects the difference between the desired configuration and the currently tracked infrastructure.

---

### Key Takeaways

* Terraform uses `terraform.tfstate` to track managed infrastructure.
* State maps Terraform resource addresses to real cloud resources.
* Terraform uses state to determine what needs to be created, updated, replaced, or destroyed.
* Deleting a state file does not delete actual cloud infrastructure.
* `terraform state list` shows all tracked resources.
* `terraform state show` displays details about a specific resource.
* `terraform state rm` stops Terraform from tracking a resource without destroying it.
* State files should not normally be committed to Git.
* Remote state is recommended for team and production environments.
* State locking helps prevent concurrent state modifications.
* The state file should not be manually edited.

---

### Outcome

✅ Successfully understood how Terraform state works, why the `terraform.tfstate` file is important, how Terraform maps configuration to real AWS infrastructure, and how to inspect and safely manage Terraform state using Terraform CLI commands.
