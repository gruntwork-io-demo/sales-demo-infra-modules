terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE S3 BUCKET
# ---------------------------------------------------------------------------------------------------------------------

module "s3_bucket" {
  source = "git::git@github.com:gruntwork-io/terraform-aws-security.git//modules/private-s3-bucket?ref=v0.73.2"

  name = var.name

  acl              = null
  bucket_ownership = "BucketOwnerEnforced"

  # This is only here for automated testing, so we can delete the bucket at the end of each test run. You will
  # most likely want to omit this in production usage.
  force_destroy = var.force_destroy
}
