# S3 Bucket

A simple S3 bucket module for sales demos.

## Why would I want to use this module?

To show customers how to manage modules in an `infrastructure-modules` repository.

## Example Terragrunt Usage

Create a `terragrunt.hcl` file that looks like the following:

```hcl
terraform {
  source = "git::https://github.com/gruntwork-io-demo/sales-demo-infra-modules.git//modules/data-stores/s3"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  name = "name-of-bucket"
}
```

## Example OpenTofu Usage

Create a `main.tf` file that looks like the following:

```hcl
provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "git@github.com:gruntwork-io/sales-demo-infra-modules.git//modules/data-stores/s3"

  name = "name-of-bucket"
}
```
