output "cloudwatch_log_group" {
  description = "All outputs from `aws_cloudwatch_log_group.default`"
  value       = aws_cloudwatch_log_group.default
}

output "cloudwatch_log_group_arn" {
  description = "Cloudwatch log group ARN"
  value       = try(aws_cloudwatch_log_group.default[0].arn, "")
}

output "cloudwatch_log_group_name" {
  description = "Cloudwatch log group name"
  value       = try(aws_cloudwatch_log_group.default[0].name, "")
}

output "container_definition" {
  description = "All outputs from `module.container_definition`"
  value       = module.container_definition
  sensitive   = true
}

output "container_definition_json" {
  description = "JSON encoded list of container definitions for use with other terraform resources such as aws_ecs_task_definition"
  value       = module.container_definition.json_map_encoded_list
  sensitive   = true
}

output "container_definition_json_map" {
  description = "JSON encoded container definitions for use with other terraform resources such as aws_ecs_task_definition"
  value       = module.container_definition.json_map_encoded
  sensitive   = true
}

output "ecs_exec_role_policy_id" {
  description = "The ECS service role policy ID, in the form of `role_name:role_policy_name`"
  value       = module.service_task.ecs_exec_role_policy_id
}

output "ecs_exec_role_policy_name" {
  description = "ECS service role name"
  value       = module.service_task.ecs_exec_role_policy_name
}

output "ecs_service_name" {
  description = "ECS Service name"
  value       = module.service_task.service_name
}

output "ecs_service_role_arn" {
  description = "ECS Service role ARN"
  value       = module.service_task.service_role_arn
}

output "ecs_service_security_group_id" {
  description = "Security Group ID of the ECS task"
  value       = module.service_task.service_security_group_id
}

output "ecs_task_definition_family" {
  description = "ECS task definition family"
  value       = module.service_task.task_definition_family
}

output "ecs_task_definition_revision" {
  description = "ECS task definition revision"
  value       = module.service_task.task_definition_revision
}

output "ecs_task_exec_role_arn" {
  description = "ECS Task exec role ARN"
  value       = module.service_task.task_exec_role_arn
}

output "ecs_task_exec_role_name" {
  description = "ECS Task role name"
  value       = module.service_task.task_exec_role_name
}

output "ecs_task_role_arn" {
  description = "ECS Task role ARN"
  value       = module.service_task.task_role_arn
}

output "ecs_task_role_id" {
  description = "ECS Task role id"
  value       = module.service_task.task_role_id
}

output "ecs_task_role_name" {
  description = "ECS Task role name"
  value       = module.service_task.task_role_name
}

output "service_task" {
  description = "All outputs from `module.service_task`"
  value       = module.service_task
}
