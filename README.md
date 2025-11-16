# terraform-module-modern
A modern, reusable Terraform module with opinionated defaults, sensible variable names, and examples to get started quickly.

Overview
This module encapsulates a focused set of Terraform resources and patterns so it can be consumed consistently across projects. It is designed to be small, composable, and easy to test.

Requirements
- Terraform 1.0 or newer
- Compatible providers declared in the module (see provider blocks in examples)

Providers
Providers required by the module should be configured by the caller. Examples use the aws provider as an illustration.

Usage

Basic
```hcl
module "example" {
    source = "./path/to/terraform-module-modern"

    # required inputs
    name   = "example"
    region = "us-east-1"

    # optional inputs with sane defaults
    tags = {
        Owner = "team"
        Env   = "dev"
    }
}
```

Advanced
```hcl
module "advanced" {
    source = "git::https://example.com/org/terraform-module-modern.git?ref=v0.1.0"

    name        = "advanced"
    region      = "us-west-2"
    enable_ssl  = true
    extra_config = {
        foo = "bar"
    }
}
```

Inputs
- name (string) — Required. Short, unique name used for resource naming.
- region (string) — Required. Cloud region or location for resources.
- tags (map) — Optional. Map of tags to apply to created resources. Default: {}
- enable_ssl (bool) — Optional. Toggle for enabling secure endpoints. Default: false
- extra_config (map) — Optional. Free-form map for provider-specific overrides. Default: {}

Outputs
- id (string) — Primary identifier for created resource(s).
- arn (string) — ARN or equivalent resource address if applicable.
- name (string) — Echoes the input name.
- attributes (map) — Additional resource attributes useful for downstream modules.

Testing
- Use terraform init and terraform plan to validate changes.
- Use terratest, kitchen-terraform, or similar tools for integration tests.
- Run static checks: tflint, terraform validate, and terraform fmt.

Best practices
- Keep modules focused on a single responsibility.
- Avoid embedding provider configuration inside modules.
- Use input validation and defaults to make modules safe to reuse.
- Document breaking changes in changelogs and use versioned releases.

Contributing
- Fork the repo, create a feature branch, and open a pull request.
- Include tests for new behavior and follow the existing code style.
- Run formatters and linters before submitting.

License
Licensed under the MIT License. See the LICENSE file for details.