# Ansible Execution Environment Builds

This repository contains custom Ansible Execution Environment (EE) definitions for Red Hat Ansible Automation Platform (AAP). These execution environments provide containerized, consistent runtime environments for Ansible playbooks with pre-installed collections, Python packages, and system dependencies.

## Available Execution Environments

### 1. ServiceNow EE (`servicenow_ee/`)
A specialized execution environment for ServiceNow ITSM automation, Windows management, and container operations.

### 2. Terraform EE (`terraform_ee/`)
A comprehensive execution environment for Infrastructure as Code (IaC) operations combining Ansible with Terraform and cloud services.

### 3. VMware EE (`vmware_ee/`)
A dedicated execution environment for VMware vSphere infrastructure management and virtualization operations.

### 4. Windows EE (`windows_ee/`)
A specialized execution environment for Microsoft Windows ecosystem automation and database management.

##  Prerequisites

- Red Hat Ansible Automation Platform 2.5+
- Container runtime (Podman/Docker)
- Access to Red Hat Container Registry
- Valid Red Hat subscription for certified content

## Quick Start

### Building Execution Environments

1. **Clone the repository:**
   ```bash
   git clone https://github.com/deperr/ee-builds.git
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

4. **Build VMware EE:**
   ```bash
   cd vmware_ee
   ansible-builder build --tag vmware-ee:latest
   ```

5. **Build Windows EE:**
   ```bash
   cd windows_ee
   ansible-builder build --tag windows-ee:latest
   ```

### Using with Ansible Automation Platform

1. **Upload to AAP:**
   - Navigate to Administration → Execution Environments
   - Add new execution environment
   - Specify the built container image

2. **Configure Job Templates:**
   - Select the appropriate EE for your playbooks
   - Ensure proper credentials are configured

## Configuration

### Galaxy Configuration
Both execution environments are configured to use multiple Ansible Galaxy servers:

- **Red Hat Certified Content** - Enterprise-grade, supported collections
- **Red Hat Validated Content** - Community collections validated by Red Hat
- **Ansible Galaxy Community** - Community-contributed collections

### Authentication
Configure authentication for private automation hubs by setting environment variables or updating the `ansible.cfg` files with appropriate tokens.

## Customization

### Adding Collections
Edit `requirements.yml` in the respective EE directory:

```yaml
collections:
  - name: your.collection
    version: ">=1.0.0"
```

### Adding Python Packages
Edit `requirements.txt`:

```txt
your-package==1.2.3
```

### Adding System Packages
Edit `bindep.txt`:

```txt
your-system-package [platform:rhel-8]
```

### Modifying Build Process
Update `execution-environment.yml` to customize:
- Base image
- Build steps
- Package manager options
- Additional build files

## Troubleshooting

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

## Best Practices

### Security

- Use Red Hat certified collections when available
- Regularly update base images and dependencies
- Implement least privilege access patterns
- Store sensitive data in AAP credentials, not in EE builds

### Maintenance

- Pin collection and package versions for reproducibility
- Test EE builds in development before production deployment
- Document custom modifications and their purposes
- Maintain separate EEs for different automation domains

### Performance

- Optimize layer caching by ordering dependencies appropriately
- Remove unnecessary packages and files
- Use multi-stage builds for complex installations
- Monitor EE size and startup times

---

## Quick Reference

| EE | Primary Use | Key Tools | Collections |
|:---:|---|---|---|
| ServiceNow | ITSM Automation | ServiceNow, Windows, Containers | servicenow.itsm, ansible.windows |
| Terraform | IaC Operations | Terraform, AWS CLI | amazon.aws, cloud.terraform |
| VMware | Virtualization Management | vSphere APIs, Proxmox | vmware.vmware_rest, community.vmware |
| Windows | Windows & SQL Server | WinRM, SQL Server, Kerberos | ansible.windows, microsoft.sql |

**Build Commands:**
```bash
# ServiceNow EE
cd servicenow_ee && ansible-builder build --tag servicenow-ee:latest

# Terraform EE  
cd terraform_ee && ansible-builder build --tag terraform-ee:latest

# VMware EE
cd vmware_ee && ansible-builder build --tag vmware-ee:latest

# Windows EE
cd windows_ee && ansible-builder build --tag windows-ee:latest
```