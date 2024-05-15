# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables must be passed in by the calling Terraform code.
# ---------------------------------------------------------------------------------------------------------------------

variable "name" {
  description = "The name to use for the S3 bucket. Must be globally unique."
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These values may optionally be overwritten by the calling Terraform code.
# ---------------------------------------------------------------------------------------------------------------------

variable "force_destroy" {
  description = "Set to true to delete all objects in the bucket before deleting the bucket."
  type        = bool
  default     = false
}
