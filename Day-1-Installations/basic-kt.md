# Day 1 - Terraform Basics

## 🎯 Goal
Understand the Terraform workflow and project structure.

---

## 🔄 Terraform Workflow

```text
Write Configuration
        ↓
terraform init
        ↓
terraform plan
        ↓
terraform apply
        ↓
Infrastructure Created
        ↓
terraform destroy (optional)
```

---

## ⚡ Essential Commands

| Command | Purpose | Run When |
|---------|---------|----------|
| `terraform init` | Downloads providers and initializes the project | Once when starting or after provider changes |
| `terraform plan` | Shows what Terraform will create, update, or destroy | Before every apply |
| `terraform apply` | Applies the planned changes | After reviewing the plan |
| `terraform destroy` | Deletes all managed resources | When cleaning up infrastructure |

> **Remember:** `plan` is a preview, `apply` makes changes.

---

## 📁 Standard Project Structure

```text
my-terraform-project/
├── .terraform/            # Downloaded provider plugins (Git ignored)
├── .terraform.lock.hcl    # Provider version lock file
├── providers.tf           # Provider configuration
├── main.tf                # Infrastructure resources
├── variables.tf           # Input variables
├── outputs.tf             # Output values
├── terraform.tfvars       # Variable values (Git ignored)
├── terraform.tfstate      # Infrastructure state (Git ignored)
└── .gitignore
```

---

## 📄 File Responsibilities

| File | Responsibility |
|------|----------------|
| `providers.tf` | Configure providers (AWS, Azure, Docker, etc.) |
| `main.tf` | Define infrastructure resources |
| `variables.tf` | Declare reusable input variables |
| `terraform.tfvars` | Assign values to variables |
| `outputs.tf` | Display useful outputs after deployment |

---

## 💡 Important Notes

- Never hardcode secrets inside `.tf` files.
- Never commit `terraform.tfstate`.
- Never commit `terraform.tfvars` if it contains secrets.
- Always run `terraform plan` before `terraform apply`.

---

## 🧠 Interview Questions

**Q:** What does `terraform init` do?

**A:** Initializes the working directory, downloads provider plugins, and prepares Terraform for use.

---

**Q:** Difference between `plan` and `apply`?

**A:**
- `plan` → Preview changes
- `apply` → Execute changes

---

## ✅ Quick Revision

```text
init     → Initialize project
plan     → Preview changes
apply    → Create/Update resources
destroy  → Delete resources
```