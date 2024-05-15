# S3 Bucket

A simple S3 bucket module for sales demos.

## Why would I want to use this module?

To show customers how to manage modules in an `infrastructure-modules` repository.

## Where is the documentation that I'm reading right now?

It's located in the [README.md file in the `modules/data-stores/s3`](https://github.com/gruntwork-io-demo/sales-demo-infra-modules/blob/main/modules/data-stores/s3/README.md) folder of the `sales-demo-infra-modules` repository.

## Example Terragrunt Usage

```hcl
terraform {
  source = "git::https://github.com/gruntwork-io-demo/sales-demo-infra-modules.git//modules/data-stores/s3?ref=v0.1.0"
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  name = "name-of-bucket"
}
```

## Example OpenTofu Usage

```hcl
# main.tf
terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = var.aws_region
}

module "s3" {
  source = "git@github.com:gruntwork-io/sales-demo-infra-modules.git//modules/data-stores/s3?ref=v0.1.0"

  name = "name-of-bucket"
}
```
