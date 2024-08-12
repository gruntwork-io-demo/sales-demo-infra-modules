output "function_name" {
  description = "The name of the Lambda function"
  value       = module.lambda.function_name
}

output "function_arn" {
  description = "The ARN of the Lambda function"
  value       = module.lambda.function_arn
}

output "function_invoke_arn" {
  description = "The invoke ARN of the Lambda function"
  value       = module.lambda.invoke_arn
}

output "qualitifed_arn" {
  description = "The qualified ARN of the Lambda function"
  value       = module.lambda.qualified_arn
}

output "iam_role_id" {
  description = "The ID of the IAM role created for the Lambda function"
  value       = module.lambda.iam_role_id
}

output "iam_role_arn" {
  description = "The ARN of the IAM role created for the Lambda function"
  value       = module.lambda.iam_role_arn
}

