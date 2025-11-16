# Terraform Modern Module

A **reusable Terraform module** designed for **fully declarative infrastructure provisioning**, driven entirely via `.tfvars`.  
This module supports fallback/default behavior, so you don’t need to explicitly specify tags or subnets if you're not using them.  

---

## Table of Contents

- [Features](#features)  
- [Requirements](#requirements)  
- [Usage](#usage)  
  - [Basic Example](#basic-example)  
  - [With Tags / Subnets](#with-tags--subnets)  
- [Inputs](#inputs)  
- [Outputs](#outputs)  
- [Module Behavior & Fallbacks](#module-behavior--fallbacks)  
- [Best Practices](#best-practices)  
- [Contributing](#contributing)  
- [License](#license)  

---

## Features

- ✅ Fully parameterized via `.tfvars` — no need to change arguments in the module code.  
- ✅ Fallback defaults when optional parameters (e.g. `tags`, `subnets`) are not provided.  
- ✅ Modular & reusable: You can use it for different environments (dev, qa, prod) by just switching tfvars.  
- ✅ Clean separation of concerns: provider, variables, and main resources are clearly structured.

---

## Requirements

- Terraform v0.x (specify the version)  
- Provider(s): (list the cloud provider(s) and versions)  
- Permissions: (any IAM / roles required to run this module)  

---

## Usage

### Basic Example

Here’s a minimal example that shows how to call this module without explicitly specifying **tags** or **subnets**, relying on fallback/defaults:

```hcl
module "modern" {
  source = "git::https://github.com/thejitenderk/terraform-module-modern.git"

  # Provide your tfvars file when running terraform:
  # terraform plan -var-file="env-dev.tfvars"
  # terraform apply -var-file="env-dev.tfvars"
}
