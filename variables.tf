variable "app_image_tag" {
  type        = string
  description = "The default container image to use in container definition"
  default     = null
}

variable "autoscaling_customized_metric_name" {
  type        = string
  description = "The name of the metric"
  default     = ""
}

variable "autoscaling_customized_statistic" {
  type        = string
  description = "The name of the metric"
  default     = "Average"
}

variable "autoscaling_customized_unit" {
  type        = string
  description = "The name of the metric"
  default     = "Count"
}

variable "autoscaling_enabled" {
  type        = bool
  default     = false
  description = "Defines if autoscaling should be enabled"
}

variable "autoscaling_max_capacity" {
  type        = number
  description = "Maximum number of running instances of a Service"
  default     = 200
}

variable "autoscaling_min_capacity" {
  type        = number
  description = "Minimum number of running instances of a Service"
  default     = 1
}

variable "autoscaling_predefined_metric_type" {
  type        = string
  description = "The metric type"
  default     = null
}

variable "autoscaling_predefined_resource_label" {
  type        = string
  description = "Needs lb arn suffix and target group arn suffix"
  default     = null
}

variable "autoscaling_scale_in_cooldown" {
  type        = number
  description = "The amount of time, in seconds, after a scale in activity completes before another scale in activity can start"
  default     = 60
}

variable "autoscaling_scale_out_cooldown" {
  type        = number
  description = "The amount of time, in seconds, after a scale out activity completes before another scale out activity can start"
  default     = 60
}

variable "autoscaling_schedule" {
  type = list(object({
    schedule     = string
    min_capacity = number
    max_capacity = number
  }))
  description = "Provides an Application AutoScaling ScheduledAction resource"
  default     = []
}

variable "autoscaling_target_value" {
  type        = number
  description = "The target value for the metric"
  default     = null
}

variable "aws_account_id" {
  type        = string
  description = "AWS Account ID"
}

variable "aws_region" {
  type        = string
  description = "The AWS region"
}

variable "circuit_breaker_deployment_enabled" {
  type        = bool
  description = "If `true`, enable the deployment circuit breaker logic for the service"
  default     = false
}

variable "circuit_breaker_rollback_enabled" {
  type        = bool
  description = "If `true`, Amazon ECS will roll back the service if a service deployment fails"
  default     = false
}

variable "cloudwatch_log_group_enabled" {
  type        = bool
  description = "A boolean to disable cloudwatch log group creation"
  default     = true
}

variable "container_cpu" {
  type        = number
  description = "The vCPU setting to control cpu limits of container. (If FARGATE launch type is used below, this must be a supported vCPU size from the table here: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-cpu-memory-error.html)"
  default     = 128
}

variable "container_map_environment" {
  type        = map(string)
  description = "The environment variables to pass to the container. This is a map of string: {key: value}. `environment` overrides `map_environment`"
  default     = null
}

variable "container_map_secrets" {
  type        = map(string)
  description = "The secrets variables to pass to the container. This is a map of string: {key: value}. map_secrets overrides secrets"
  default     = null
}

variable "container_memory" {
  type        = number
  description = "The amount of RAM to allow container to use in MB. (If FARGATE launch type is used below, this must be a supported Memory size from the table here: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-cpu-memory-error.html)"
  default     = null
}

variable "container_memory_reservation" {
  type        = number
  description = "The amount of RAM (Soft Limit) to allow container to use in MB. This value must be less than `container_memory` if set"
  default     = 128
}

variable "container_start_timeout" {
  type        = number
  description = "Time duration (in seconds) to wait before giving up on resolving dependencies for a container"
  default     = null
}

variable "container_stop_timeout" {
  type        = number
  description = "Time duration (in seconds) to wait before the container is forcefully killed if it doesn't exit normally on its own"
  default     = null
}

variable "deployment_maximum_percent" {
  type        = number
  description = "The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment"
  default     = 200
}

variable "deployment_minimum_healthy_percent" {
  type        = number
  description = "The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment"
  default     = 100
}

variable "desired_count" {
  type        = number
  description = "The desired number of tasks to start with. Set this to 0 if using DAEMON Service type. (FARGATE does not suppoert DAEMON Service type)"
  default     = 1
}

variable "docker_labels" {
  type        = map(string)
  description = "The configuration options to send to the `docker_labels`"
  default     = null
}

variable "exec_enabled" {
  type        = bool
  description = "Specifies whether to enable Amazon ECS Exec for the tasks within the service"
  default     = true
}

variable "healthcheck" {
  type = object({
    command     = list(string)
    retries     = number
    timeout     = number
    interval    = number
    startPeriod = number
  })
  description = "A map containing command (string), timeout, interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy), and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries)"
  default     = null
}

variable "ignore_changes_desired_count" {
  type        = bool
  description = "Whether to ignore changes for desired count in the ECS service"
  default     = true
}

variable "ignore_changes_task_definition" {
  type        = bool
  description = "Ignore changes (like environment variables) to the ECS task definition"
  default     = false
}

variable "label_orders" {
  type = object({
    cloudwatch = optional(list(string)),
    ecr        = optional(list(string)),
    ecs        = optional(list(string), ["stage", "name"]),
    iam        = optional(list(string)),
    sentry     = optional(list(string), ["stage", "name"]),
    ssm        = optional(list(string)),
    vpc        = optional(list(string))
  })
  default     = {}
  description = "Overrides the `labels_order` for the different labels to modify ID elements appear in the `id`"
}

variable "launch_type" {
  type        = string
  description = "The ECS launch type (valid options: FARGATE or EC2)"
  default     = "EC2"
}

variable "log_driver" {
  type        = string
  description = "The log driver to use for the container. If using Fargate launch type, only supported value is awslogs"
  default     = "awsfirelens"
}

variable "log_retention_in_days" {
  type        = number
  description = "The number of days to retain logs for the log group"
  default     = 1
}

variable "log_router_container_cpu" {
  type        = string
  description = "The log router cpu reservation for the ECS task definition"
  default     = 30
}

variable "log_router_container_memory_reservation" {
  type        = string
  description = "The log router cpu reservation for the ECS task definition"
  default     = 64
}

variable "log_router_image_repository" {
  type        = string
  description = "Container registry repository url"
}

variable "log_router_image_tag" {
  type        = string
  description = "The default container image to use in container definition"
  default     = "stable"
}

variable "log_router_map_environment" {
  type        = map(string)
  description = "The environment variables to pass to the container. This is a map of string: {key: value}. `environment` overrides `map_environment`"
  default     = null
}

variable "log_router_options" {
  type        = map(string)
  description = "The log router options to use"
  default = {
    config-file-type  = "file",
    config-file-value = "/fluent-bit/etc/extra.conf"
  }
}

variable "log_router_type" {
  type        = string
  description = "The log router type to use"
  default     = "fluentbit"
}

variable "mpr_enabled" {
  type        = bool
  description = "Whether to use the StreamMprMessagesPerRunner metric for autoscaling (gosoline feature), see: https://github.com/justtrackio/gosoline"
  default     = false
}

variable "network_mode" {
  type        = string
  description = "The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type` or `null` for `EC2` `launch_type`"
  default     = null
}

variable "ordered_placement_strategy" {
  type = list(object({
    type  = string
    field = string
  }))
  default = [{
    type  = "spread"
    field = "instanceId"
  }]
  description = <<-EOT
    Service level strategy rules that are taken into consideration during task placement.
    List from top to bottom in order of precedence. The maximum number of ordered_placement_strategy blocks is 5.
    See [`ordered_placement_strategy`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#ordered_placement_strategy)
    EOT
}

variable "port_gateway" {
  type        = number
  description = "Define the gateway port"
  default     = 8088
}

variable "port_health" {
  type        = number
  description = "Define the health port"
  default     = 8090
}

variable "port_mappings" {
  type = list(object({
    containerPort = number
    hostPort      = number
    protocol      = string
  }))
  description = "The port mappings to configure for the container. This is a list of maps. Each map should contain \"containerPort\", \"hostPort\", and \"protocol\", where \"protocol\" is one of \"tcp\" or \"udp\". If using containers in a task with the awsvpc or host network mode, the hostPort can either be left blank or set to the same value as the containerPort"
  default     = []
}

variable "port_metadata" {
  type        = number
  description = "Define the metadata port"
  default     = 8070
}

variable "service_placement_constraints" {
  type = list(object({
    type       = string
    expression = string
  }))
  description = "The rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. See [`placement_constraints`](https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1) docs"
  default     = []
}

variable "target_group_arn" {
  type        = string
  description = "The ARN of the Target Group to which to route traffic"
  default     = ""
}

variable "task_cpu" {
  type        = number
  description = "The number of CPU units used by the task. If unspecified, it will default to `container_cpu`. If using `FARGATE` launch type `task_cpu` must match supported memory values (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size)"
  default     = null
}

variable "task_memory" {
  type        = number
  description = "The amount of memory (in MiB) used by the task. If unspecified, it will default to `container_memory`. If using Fargate launch type `task_memory` must match supported cpu value (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size)"
  default     = null
}

variable "task_policy_arns" {
  type        = list(string)
  description = "A list of IAM Policy ARNs to attach to the generated task role."
  default     = []
}

variable "ulimits" {
  type = list(object({
    name      = string
    softLimit = number
    hardLimit = number
  }))
  description = "The ulimits to configure for the container. This is a list of maps. Each map should contain \"name\", \"softLimit\" and \"hardLimit\""
  default     = []
}

variable "wait_for_steady_state" {
  type        = bool
  description = "If true, it will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing"
  default     = true
}

variable "working_directory" {
  type        = string
  description = "The working directory to run commands inside the container"
  default     = "/app"
}

variable "domain" {
  type        = string
  description = ""
}

variable "organizational_unit" {
  type        = string
  description = ""
}
