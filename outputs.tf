output "alb_ingress_target_group_arn" {
  description = "ARN of the ALB's target group where the ecs service registers itself into"
  value       = try(module.alb_ingress[0].target_group_arn, null)
}
