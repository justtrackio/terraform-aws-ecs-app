locals {
  ecs_load_balancers = local.alb_enabled ? [{
    target_group_arn = var.target_group_arn
    container_name   = module.ecs_label.id
    elb_name         = null
    container_port   = var.port_gateway
  }] : []
  container_cpu = var.container_cpu != null ? var.container_cpu : data.aws_ssm_parameter.container_cpu[0].value
  docker_labels = merge(var.docker_labels, {
    Application                                                                                        = "${module.this.stage}-${module.this.name}"
    Domain                                                                                             = "${module.this.environment}.${var.organizational_unit}.${module.this.namespace}"
    "traefik.enable"                                                                                   = true
    "traefik.http.routers.metadata-${module.this.stage}-${module.this.name}.entrypoints"               = "metadata"
    "traefik.http.routers.metadata-${module.this.name}.service"                                        = "metadata-${module.this.stage}-${module.this.name}"
    "traefik.http.services.metadata-${module.this.stage}-${module.this.name}.loadbalancer.server.port" = 8070
    "traefik.http.routers.gateway-${module.this.stage}-${module.this.name}.entrypoints"                = "gateway"
    "traefik.http.routers.gateway-${module.this.stage}-${module.this.name}.service"                    = "gateway-${module.this.stage}-${module.this.name}"
    "traefik.http.services.gateway-${module.this.stage}-${module.this.name}.loadbalancer.server.port"  = 8088
    "traefik.http.routers.health-${module.this.stage}-${module.this.name}.entrypoints"                 = "health"
    "traefik.http.routers.health-${module.this.stage}-${module.this.name}.service"                     = "health-${module.this.stage}-${module.this.name}"
    "traefik.http.services.health-${module.this.stage}-${module.this.name}.loadbalancer.server.port"   = 8090
  })
  total_cpu             = local.container_cpu + var.log_router_container_cpu
  task_cpu              = var.task_cpu != null ? local.total_cpu > var.task_cpu ? local.total_cpu : var.task_cpu : null
  container_memory      = var.container_memory_reservation != null ? var.container_memory_reservation : data.aws_ssm_parameter.container_memory_reservation[0].value
  total_memory          = local.container_memory + var.log_router_container_memory_reservation
  task_memory           = var.task_memory != null ? local.total_memory > var.task_memory ? local.total_memory : var.task_memory : null
  image_tag             = var.app_image_tag == null ? data.aws_ssm_parameter.container_tag[0].value : var.app_image_tag
  port_mappings         = length(var.port_mappings) != 0 ? var.port_mappings : local.default_port_mappings
  healthcheck           = var.healthcheck != null ? var.healthcheck : local.default_healthcheck
  container_definitions = "[${module.container_definition.json_map_encoded}, ${module.container_definition_fluentbit.json_map_encoded}]"
  task_policies         = setunion(var.task_policy_arns, local.default_policies)
  default_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    "arn:aws:iam::aws:policy/AmazonRoute53AutoNamingReadOnlyAccess",
  ]
  default_port_mappings = [
    {
      containerPort = var.port_health
      hostPort      = 0
      protocol      = "tcp"
    },
    {
      containerPort = var.port_gateway
      hostPort      = 0
      protocol      = "tcp"
    },
    {
      containerPort = var.port_metadata
      hostPort      = 0
      protocol      = "tcp"
    }
  ]
  default_healthcheck = {
    command = [
      "CMD",
      "/usr/bin/wget",
      "--spider",
      "localhost:${var.port_health}/health"
    ],
    retries     = 3
    timeout     = 5
    interval    = 10
    startPeriod = 60
  }
}

module "ecs_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  label_order = var.label_orders.ecs

  context = module.this.context
}

resource "aws_cloudwatch_log_group" "default" {
  count = var.cloudwatch_log_group_enabled ? 1 : 0

  name              = module.this.id
  tags              = module.this.tags
  retention_in_days = var.log_retention_in_days
}

module "container_definition" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.58.3"

  container_name               = module.ecs_label.id
  container_image              = "${module.ecr.repository_url}:${local.image_tag}"
  container_memory             = var.container_memory
  container_memory_reservation = var.container_memory_reservation
  container_cpu                = var.container_cpu
  start_timeout                = var.container_start_timeout
  stop_timeout                 = var.container_stop_timeout
  healthcheck                  = local.healthcheck
  map_environment = merge(var.container_map_environment, {
    AWS_SDK_RETRIES                                              = 10
    AWS_DEFAULT_REGION                                           = var.aws_region
    ENV                                                          = module.this.environment
    ENVIRONMENT                                                  = module.this.environment
    SENTRY_DSN                                                   = module.sentry.dsn
    SENTRY_ENVIRONMENT                                           = module.this.environment
    METRIC_WRITER                                                = "cw"
    REDIS_DEFAULT_ADDRESS                                        = ""
    REDIS_DEFAULT_DIALER                                         = "srv"
    CLOUD_AWS_DEFAULTS_ENDPOINT                                  = ""
    CLOUD_AWS_SQS_CLIENTS_AUTOMATION_NAMING_PATTERN              = "!nodecode {env}-{app}-{queueId}"
    LOG_HANDLERS_MAIN_FORMATTER                                  = "json"
    LOG_HANDLERS_MAIN_TIMESTAMP_FORMAT                           = "2006-01-02T15:04:05.999Z07:00"
    METRIC_CLOUDWATCH_NAMING_PATTERN                             = "!nodecode {env}/{group}-{app}"
    STREAM_METRICS_MESSAGES_PER_RUNNER_ECS_SERVICE               = "{app_group}-{app_name}"
    STREAM_METRICS_MESSAGES_PER_RUNNER_CLOUDWATCH_NAMING_PATTERN = "!nodecode {env}/{group}-{app}"
    STREAM_METRICS_MESSAGES_PER_RUNNER_DYNAMODB_NAMING_PATTERN   = "!nodecode {env}-{modelId}"
    TRACING_ADDR_TYPE                                            = "srv"
    FIXTURE_GROUP_NAME                                           = "$FIXTURE_GROUP_NAME"
  })
  map_secrets       = var.container_map_secrets
  port_mappings     = local.port_mappings
  ulimits           = var.ulimits
  working_directory = var.working_directory
  docker_labels     = local.docker_labels

  log_configuration = {
    logDriver     = var.log_driver
    options       = {}
    secretOptions = null
  }
}

module "container_definition_fluentbit" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.58.3"

  container_name               = "log_router"
  container_image              = "${var.log_router_image_repository}:${var.log_router_image_tag}"
  container_cpu                = var.log_router_container_cpu
  container_memory_reservation = var.log_router_container_memory_reservation
  firelens_configuration = {
    type    = var.log_router_type
    options = var.log_router_options
  }

  log_configuration = {
    logDriver = "awslogs"
    options = {
      awslogs-group  = try(aws_cloudwatch_log_group.default[0].name, ""),
      awslogs-region = var.aws_region
    }
  }

  map_environment = {
    FLUENTD_HOSTNAME = "fluentd.${var.organizational_unit}-monitoring.${var.domain}"
    FLUENTD_PORT     = 15000
    TAG              = "${module.this.environment}-${module.this.namespace}-${module.this.stage}-${module.this.name}"
  }
}

module "service_task" {
  source  = "justtrackio/ecs-alb-service-task/aws"
  version = "1.0.0"

  circuit_breaker_deployment_enabled = var.circuit_breaker_deployment_enabled
  circuit_breaker_rollback_enabled   = var.circuit_breaker_rollback_enabled
  container_definition_json          = local.container_definitions
  deployment_maximum_percent         = var.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.deployment_minimum_healthy_percent
  desired_count                      = var.desired_count
  ecs_cluster_arn                    = data.aws_ecs_cluster.default.arn
  ecs_load_balancers                 = local.ecs_load_balancers
  exec_enabled                       = var.exec_enabled
  ignore_changes_desired_count       = var.ignore_changes_desired_count
  ignore_changes_task_definition     = var.ignore_changes_task_definition
  launch_type                        = var.launch_type
  network_mode                       = var.network_mode
  ordered_placement_strategy         = var.ordered_placement_strategy
  service_placement_constraints      = var.service_placement_constraints
  task_cpu                           = local.task_cpu
  task_exec_policy_arns              = local.task_policies
  task_memory                        = local.task_memory
  task_policy_arns                   = local.task_policies
  vpc_id                             = data.aws_vpc.default.id
  wait_for_steady_state              = var.wait_for_steady_state

  label_orders = var.label_orders
  context      = module.this.context
}
