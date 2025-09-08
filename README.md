# Ansible Execution Environment Builds

This repository contains custom Ansible Execution Environment (EE) definitions for Red Hat Ansible Automation Platform (AAP). These execution environments provide containerized, consistent runtime environments for Ansible playbooks with pre-installed collections, Python packages, and system dependencies.

## 🏗️ Available Execution Environments

### 1. ServiceNow EE (`servicenow_ee/`)
A specialized execution environment for ServiceNow ITSM automation, Windows management, and container operations.

**Key Features:**
- ServiceNow ITSM integration capabilities
- Windows and Linux system management
- Container orchestration with Podman
- NTLM/CredSSP authentication support

**Primary Use Cases:**
- ServiceNow incident, change, and problem management
- Windows server automation and configuration
- Cross-platform system administration
- Container-based application deployment

### 2. Terraform EE (`terraform_ee/`)
A comprehensive execution environment for Infrastructure as Code (IaC) operations combining Ansible with Terraform and cloud services.

**Key Features:**
- Terraform 1.10.3 for infrastructure provisioning
- AWS CLI v2 for cloud operations
- AAP configuration management
- Multi-cloud infrastructure automation

**Primary Use Cases:**
- Infrastructure provisioning with Terraform
- AWS resource management and automation
- AAP/AWX configuration and deployment
- Hybrid cloud infrastructure operations

## 📋 Prerequisites

- Red Hat Ansible Automation Platform 2.5+
- Container runtime (Podman/Docker)
- Access to Red Hat Container Registry
- Valid Red Hat subscription for certified content

## 🚀 Quick Start

### Building Execution Environments

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd ee-builds
   ```

2. **Build ServiceNow EE:**
   ```bash
   cd servicenow_ee
   ansible-builder build --tag servicenow-ee:latest
   ```

3. **Build Terraform EE:**
   ```bash
   cd terraform_ee
   ansible-builder build --tag terraform-ee:latest
   ```

### Using with Ansible Automation Platform

1. **Upload to AAP:**
   - Navigate to Administration → Execution Environments
   - Add new execution environment
   - Specify the built container image

2. **Configure Job Templates:**
   - Select the appropriate EE for your playbooks
   - Ensure proper credentials are configured

## 📦 Component Details

### ServiceNow EE Components

#### Ansible Collections
- `servicenow.itsm` - ServiceNow IT Service Management
- `ansible.posix` - POSIX system operations
- `community.general` - General-purpose modules
- `containers.podman` - Container management
- `ansible.utils` - Utility functions
- `ansible.windows` - Windows automation
- `community.windows` - Extended Windows support

#### Python Dependencies
- `requests-credssp` - NTLM/CredSSP authentication

#### System Packages
- `findutils`, `gcc`, `make` - Build essentials

### Terraform EE Components

#### Ansible Collections
- `amazon.aws` - AWS service modules
- `amazon.cloud` - Extended AWS functionality
- `infra.aap_configuration` - AAP configuration management
- `ansible.posix` - POSIX operations
- `awx.awx` - AWX/AAP API integration
- `cloud.terraform` - Terraform state management

#### Python Dependencies
- `pysnow` - ServiceNow API client
- `requests` - HTTP library
- `netaddr` - Network address manipulation
- `botocore`, `boto3` - AWS SDK

#### Additional Tools
- **Terraform 1.10.3** - Infrastructure as Code
- **AWS CLI v2** - AWS command-line interface

#### System Packages
- `unzip` - Archive extraction
- `dnf` - Package management
- Development tools for compilation

## 🔧 Configuration

### Galaxy Configuration
Both execution environments are configured to use multiple Ansible Galaxy servers:

- **Red Hat Certified Content** - Enterprise-grade, supported collections
- **Red Hat Validated Content** - Community collections validated by Red Hat
- **Ansible Galaxy Community** - Community-contributed collections

### Authentication
Configure authentication for private automation hubs by setting environment variables or updating the `ansible.cfg` files with appropriate tokens.

### Modifying Build Process
Update `execution-environment.yml` to customize:
- Base image
- Build steps
- Package manager options
- Additional build files

## 🔍 Troubleshooting

### Common Issues

**Build Failures:**
- Verify Red Hat subscription and registry access
- Check network connectivity to package repositories
- Ensure sufficient disk space for build process

**Collection Installation:**
- Verify Galaxy server accessibility
- Check authentication credentials for private hubs
- Review collection version compatibility

**Runtime Issues:**
- Confirm execution environment is properly uploaded to AAP
- Verify job template EE configuration
- Check playbook compatibility with installed collections

### Debug Mode
Enable verbose output during build:

```bash
ansible-builder build --tag your-ee:latest --verbosity 3
```

## 🆘 Support

For issues related to:
- **Execution Environment builds**: Create an issue in this repository
- **Ansible collections**: Refer to collection documentation
- **Red Hat AAP**: Contact Red Hat Support
- **ServiceNow integration**: Consult ServiceNow documentation

---

## 📋 Quick Reference

| EE | Primary Use | Key Tools | Collections |
|---|---|---|---|
| ServiceNow EE | ITSM Automation | ServiceNow, Windows, Containers | servicenow.itsm, ansible.windows |
| Terraform EE | IaC Operations | Terraform, AWS CLI | amazon.aws, cloud.terraform |

**Build Commands:**
```bash
# ServiceNow EE
cd servicenow_ee && ansible-builder build --tag servicenow-ee:latest

# Terraform EE  
cd terraform_ee && ansible-builder build --tag terraform-ee:latest
```