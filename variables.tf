variable "alarm_consumer" {
  type = map(object({
    alarm_description      = optional(string)
    datapoints_to_alarm    = optional(number, 3)
    evaluation_periods     = optional(number, 3)
    period                 = optional(number, 60)
    success_rate_threshold = optional(number, 99)
    alarm_priority_high    = optional(string, "high")
    alarm_priority_warning = optional(string, "warning")
  }))
  default     = {}
  description = "This can be used to override alarms for consumers. Keys are names of the consumers."
}

variable "alarm_enabled" {
  type        = bool
  default     = false
  description = "Defines if alarms should be created"
}

variable "alarm_gateway" {
  type = map(object({
    alarm_description      = optional(string)
    datapoints_to_alarm    = optional(number, 3)
    evaluation_periods     = optional(number, 3)
    period                 = optional(number, 60)
    success_rate_threshold = optional(number, 99)
    alarm_priority_high    = optional(string, "high")
    alarm_priority_warning = optional(string, "warning")
  }))
  default     = {}
  description = "This can be used to override alarms for gateway routes. Keys are names of the gateway route."
}

variable "alarm_kinsumer" {
  type = map(object({
    alarm_description        = optional(string)
    datapoints_to_alarm      = optional(number, 1)
    evaluation_periods       = optional(number, 1)
    period                   = optional(number, 60)
    threshold_seconds_behind = optional(number, 3600)
    alarm_priority_high      = optional(string, "high")
    alarm_priority_warning   = optional(string, "warning")
  }))
  default     = {}
  description = "This can be used to override alarms for kinsumers. Keys are names of the kinsumers."
}

variable "alarm_scheduled" {
  type = object({
    alarm_description   = optional(string)
    datapoints_to_alarm = optional(number, 1)
    evaluation_periods  = optional(number, 1)
    period              = optional(number, 60)
    threshold           = optional(number, 0)
    alarm_priority      = optional(string, "high")
  })
  default     = {}
  description = "This can be used to override scheduled alarm"
}

variable "alarm_service_resources_cpu_average" {
  type = object({
    datapoints_to_alarm = optional(number, 6)
    evaluation_periods  = optional(number, 6)
    period              = optional(number, 300)
    threshold           = optional(number, 125)
  })
  description = "Average CPUUtilization alarm specs"
  default = {
    datapoints_to_alarm = 6
    evaluation_periods  = 6
    period              = 300
    threshold           = 125
  }
}

variable "alarm_service_resources_cpu_maximum" {
  type = object({
    datapoints_to_alarm = optional(number, 15)
    evaluation_periods  = optional(number, 15)
    period              = optional(number, 60)
    threshold           = optional(number, 150)
  })
  description = "Maximum CPUUtilization alarm specs"
  default = {
    datapoints_to_alarm = 15
    evaluation_periods  = 15
    period              = 60
    threshold           = 150
  }
}

variable "alarm_service_resources_enabled" {
  type        = bool
  default     = false
  description = "Defines if resource alarms should be created"
}

variable "alarm_service_resources_memory_average" {
  type = object({
    datapoints_to_alarm = optional(number, 6)
    evaluation_periods  = optional(number, 6)
    period              = optional(number, 300)
    threshold           = optional(number, 125)
  })
  description = "Average MemoryUtilization alarm specs"
  default = {
    datapoints_to_alarm = 6
    evaluation_periods  = 6
    period              = 300
    threshold           = 125
  }
}

variable "alarm_service_resources_memory_maximum" {
  type = object({
    datapoints_to_alarm = optional(number, 15)
    evaluation_periods  = optional(number, 15)
    period              = optional(number, 60)
    threshold           = optional(number, 150)
  })
  description = "Maximum MemoryUtilization alarm specs"
  default = {
    datapoints_to_alarm = 15
    evaluation_periods  = 15
    period              = 60
    threshold           = 150
  }
}

variable "alarm_service_resources_priority" {
  type        = string
  description = "Priority for service resources alarms"
  default     = "info"
}

variable "alarm_service_resources_treat_missing_data" {
  type        = string
  default     = "breaching"
  description = "How to treat missing data, defaults to 'breaching'"
}

variable "alb_health_check" {
  type = object({
    enabled             = optional(bool, true)
    healthy_threshold   = optional(number, 2)
    unhealthy_threshold = optional(number, 2)
    threshold           = optional(number, 2)
    interval            = optional(number, 30)
    timeout             = optional(number, 10)
    matcher             = optional(string, "200")
    path                = optional(string, "/health")
    port                = optional(string, "traffic-port")
    protocol            = optional(string, "HTTP")
  })
  default     = {}
  description = "ALB target group healthy check values"
}

variable "alb_name" {
  type        = string
  description = "Name of the alb used to attach the target group"
  default     = ""
}

variable "alb_stickiness_enabled" {
  type        = bool
  default     = false
  description = "Boolean to enable / disable `stickiness`. Default is `true`"
}

variable "alb_unauthenticated_hosts" {
  type        = list(string)
  default     = []
  description = "Unauthenticated hosts to match in Hosts header"
}

variable "alb_unauthenticated_paths" {
  type        = list(string)
  default     = ["*"]
  description = "Unauthenticated path pattern to match (a maximum of 1 can be defined)"
}

variable "alb_unauthenticated_priority" {
  type        = number
  default     = 100
  description = "The priority for the rules without authentication, between 1 and 50000 (1 being highest priority). Must be different from `authenticated_priority` since a listener can't have multiple rules with the same priority"
}

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
  default     = null
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
  default     = null
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

variable "domain" {
  type        = string
  description = "The default domain"
}

variable "ecr_repository_lifecycle_policy" {
  type        = string
  default     = null
  description = "The policy document. This is a JSON formatted string. See more details about [Policy Parameters](http://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html#lifecycle_policy_parameters) in the official AWS docs"
}

variable "elasticsearch_host" {
  type        = string
  default     = null
  description = "Defines the elasticsearch host to query for logs"
}

variable "elasticsearch_index_template" {
  type = object({
    additional_fields  = map(any)
    name               = string
    priority           = number
    node_name          = string
    number_of_shards   = number
    number_of_replicas = number
  })
  default = {
    additional_fields  = {}
    name               = ""
    priority           = 250
    node_name          = "*"
    number_of_shards   = 1
    number_of_replicas = 1
  }
  description = "This defines the properties used within the index template (Only used if create_elasticsearch_data_stream is true)"
}

variable "elasticsearch_lifecycle_policy" {
  type = object({
    delete_phase_min_age             = string
    hot_phase_max_primary_shard_size = string
    hot_phase_max_age                = optional(string)
    warm_phase_min_age               = string
    warm_phase_number_of_replicas    = number
  })
  default = {
    delete_phase_min_age             = "28d"
    hot_phase_max_primary_shard_size = "10gb"
    warm_phase_min_age               = "1d"
    warm_phase_number_of_replicas    = 0
  }
  description = "This defines the properties used within the index lifecycle management policy (Only used if create_elasticsearch_data_stream is true)"
}

variable "exec_enabled" {
  type        = bool
  description = "Specifies whether to enable Amazon ECS Exec for the tasks within the service"
  default     = true
}

variable "gosoline_metadata" {
  type = object({
    domain    = optional(string),
    use_https = optional(string),
    port      = optional(string)
  })
  description = "Define custom metadata for the gosoline provider"
  default     = null
}

variable "gosoline_name_patterns" {
  type = object({
    hostname                         = optional(string),
    cloudwatch_namespace             = optional(string),
    ecs_cluster                      = optional(string),
    ecs_service                      = optional(string),
    grafana_cloudwatch_datasource    = optional(string),
    grafana_elasticsearch_datasource = optional(string)
  })
  description = "Define custom name patters for the gosoline provider"
  default = {
    hostname                         = "{scheme}://{app}.{group}.{env}.{metadata_domain}:{port}"
    cloudwatch_namespace             = "{env}/{group}/{app}"
    ecs_cluster                      = "{env}"
    ecs_service                      = "{group}-{app}"
    grafana_cloudwatch_datasource    = "cloudwatch-{family}"
    grafana_elasticsearch_datasource = "elasticsearch-{env}-{family}-{group}-{app}"
  }
}

variable "grafana_dashboard_url" {
  type        = string
  description = "Url of the grafana dashboard"
  default     = null
}

variable "health_check_grace_period_seconds" {
  type        = number
  description = "Seconds to ignore failing load balancer health checks on newly instantiated tasks to prevent premature shutdown, up to 7200. Only valid for services configured to use load balancers"
  default     = 0
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

variable "kibana_data_view_enabled" {
  type        = bool
  default     = true
  description = "Defines whether there will be a kibana data view"
}

variable "kibana_host" {
  type        = string
  default     = null
  description = "Defines the kibana host"
}

variable "kibana_space_id" {
  type        = string
  default     = null
  description = "Space identifier to place the kibana data view into"
}

variable "label_orders" {
  type = object({
    cloudwatch    = optional(list(string), ["environment", "stage", "name"]),
    ecr           = optional(list(string)),
    ecs           = optional(list(string), ["stage", "name"]),
    ec2           = optional(list(string), ["environment", "stage", "name"]),
    iam           = optional(list(string)),
    sentry        = optional(list(string), ["stage", "name"]),
    ssm           = optional(list(string)),
    vpc           = optional(list(string)),
    elasticsearch = optional(list(string), ["environment", "namespace", "stage", "name"])
    kibana        = optional(list(string))
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
  description = "The log router memory reservation for the ECS task definition"
  default     = 64
}

variable "log_router_essential" {
  type        = bool
  description = "Determines whether all other containers in a task are stopped, if this container fails or stops for any reason. Due to how Terraform type casts booleans in json it is required to double quote this value"
  default     = false
}

variable "log_router_image_repository" {
  type        = string
  description = "Container registry repository url"
}

variable "log_router_image_tag" {
  type        = string
  description = "The default container image to use in container definition"
  default     = "stable-3.0.7"
}

variable "log_router_options" {
  type        = map(string)
  description = "The log router options to use"
  default = {
    config-file-type  = "file",
    config-file-value = "/fluent-bit/etc/extra.conf"
  }
}

variable "log_router_stop_timeout" {
  type        = number
  description = "Time duration (in seconds) to wait before the container is forcefully killed if it doesn't exit normally on its own"
  default     = 60
}

variable "log_router_type" {
  type        = string
  description = "The log router type to use"
  default     = "fluentbit"
}

variable "metric_based_autoscaling_ignore_changes_min_max_capacity" {
  type        = bool
  description = "Whether or not to ignore min_capacity/max_capacity changes on the aws_appautoscaling_target of the metric based autoscaling module"
  default     = false
}

variable "metric_calculator_enabled" {
  type        = bool
  description = "Whether to use the metrics produced by the metric calculator for autoscaling (gosoline feature), see: https://github.com/justtrackio/gosoline"
  default     = null
}

variable "metric_enabled" {
  type        = bool
  description = "Defines if metrics should be written"
}

variable "monitoring_enabled" {
  type        = bool
  default     = true
  description = "Defines if the monitoring module should be created"
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

variable "propagate_tags" {
  type        = string
  description = "Specifies whether to propagate the tags from the task definition or the service to the tasks. The valid values are SERVICE and TASK_DEFINITION"
  default     = null
}

variable "scheduled_autoscaling_ignore_changes_min_max_capacity" {
  type        = bool
  description = "Whether or not to ignore min_capacity/max_capacity changes on the aws_appautoscaling_target of the scheduled autoscaling module"
  default     = true
}

variable "sentry_alarm_action_match" {
  type        = string
  description = "Trigger actions when an event is captured by Sentry and `any` or `all` of the specified conditions happen."
  default     = "any"
}

variable "sentry_alarm_actions" {
  type        = string
  description = "List of actions. In JSON string format."
  default     = "[]"
}

variable "sentry_alarm_conditions" {
  type        = string
  description = "List of conditions. In JSON string format."
  default     = "[]"
}

variable "sentry_alarm_filter_match" {
  type        = string
  description = "A string determining which filters need to be true before any actions take place. Required when a value is provided for filters."
  default     = "all"
}

variable "sentry_alarm_filters" {
  type        = string
  description = "A list of filters that determine if a rule fires after the necessary conditions have been met. In JSON string format."
  default     = null
}

variable "sentry_alarm_frequency" {
  type        = number
  description = "Perform actions at most once every X minutes for this issue."
  default     = 5
}

variable "sentry_dsn" {
  type        = string
  description = "Define a custom sentry dsn if `sentry_enabled` is set to ``false"
  default     = null
}

variable "sentry_enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources for sentry"
  default     = true
}

variable "service_placement_constraints" {
  type = list(object({
    type       = string
    expression = string
  }))
  description = "The rules that are taken into consideration during task placement. Maximum number of placement_constraints is 10. See [`placement_constraints`](https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1) docs"
  default     = []
}

variable "service_registries" {
  type        = list(any)
  description = <<-EOT
    Zero or one service discovery registries for the service.
    The currently supported service registry is Amazon Route 53 Auto Naming Service - `aws_service_discovery_service`;
    see `service_registries` docs https://www.terraform.io/docs/providers/aws/r/ecs_service.html#service_registries-1"
    Service registry is object with required key `registry_arn = string` and optional keys
      `port           = number`
      `container_name = string`
      `container_port = number`
    EOT

  default = []
}

variable "target_group_arn" {
  type        = string
  description = "ARN of the target group to register the task into. Only works when alb_name is not specified. Can be used for services that are made available via a vpc endpoint"
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

variable "tracing_provider" {
  type        = string
  description = "Defines which tracing provider to use. Valid values are 'local', 'xray', 'noop', or any tracer you registered yourself"
  default     = "local"
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
