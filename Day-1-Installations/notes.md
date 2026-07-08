## 🛠️ Installing Terraform on Windows

### Step 1: Download Terraform

- Download the latest Terraform binary from the official HashiCorp website.
- Extract the downloaded ZIP file.

### Step 2: Add Terraform to PATH

1. Create a folder such as:
   ```text
   C:\Terraform
   ```
   or
   ```text
   D:\Terraform
   ```
2. Copy `terraform.exe` into that folder.
3. Open **Environment Variables**.
4. Under **System Variables**, select **Path** → **Edit** → **New**.
5. Add the Terraform folder path (e.g., `C:\Terraform`).
6. Open a new Command Prompt or PowerShell window and verify the installation:

```bash
terraform --version
```

If installed correctly, Terraform will display its version.

---

## 💻 Recommended VS Code Extensions

Install the following extensions:

| Extension | Purpose |
|-----------|---------|
| HashiCorp Terraform | Terraform language support, syntax highlighting, validation, and formatting |
| HashiCorp Sentinel | Sentinel policy language support |
| HashiCorp HCL | Syntax highlighting for HashiCorp Configuration Language (HCL) |

---

## 📁 Best Practice

Keep all your Terraform projects inside a single parent folder, for example:

```text
Terraform/
├── project-1/
├── project-2/
├── aws-lab/
└── azure-lab/
```

This keeps your projects organized and makes them easier to manage.

> **Note:** Each Terraform project creates its own `.terraform` directory to store downloaded provider plugins. These directories can consume significant disk space, so keeping projects in one location makes cleanup and management easier.