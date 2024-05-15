terraform {
  required_version = ">= 1.0.0"
}

# ---------------------------------------------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ---------------------------------------------------------------------------------------------------------------------

provider "aws" {
  region = var.aws_region
}

module "s3" {
  # When using these modules in your own repos, you will need to use a Git URL with a ref attribute that pins you
  # to a specific version of the modules, such as the following example:
  # source = "git@github.com:gruntwork-io/sales-demo-infra-modules.git//modules/data-stores/s3?ref=v0.1.0"
  source = "../../../modules/data-stores/s3"

  name = var.name

  # This is only here for automated testing, so we can delete the bucket at the end of each test run. You will
  # most likely want to omit this in production usage.
  force_destroy = true
}
