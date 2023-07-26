# terraform-aws-ecs-app
Terraform module which creates a ecs app

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67 |
| <a name="requirement_elasticsearch"></a> [elasticsearch](#requirement\_elasticsearch) | 2.0.7 |
| <a name="requirement_elasticstack"></a> [elasticstack](#requirement\_elasticstack) | 0.5.0 |
| <a name="requirement_gosoline"></a> [gosoline](#requirement\_gosoline) | 0.0.12 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 1.40.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb_ingress"></a> [alb\_ingress](#module\_alb\_ingress) | cloudposse/alb-ingress/aws | 0.25.1 |
| <a name="module_cloudwatch_label"></a> [cloudwatch\_label](#module\_cloudwatch\_label) | justtrackio/label/null | 0.26.0 |
| <a name="module_container_definition"></a> [container\_definition](#module\_container\_definition) | cloudposse/ecs-container-definition/aws | 0.58.3 |
| <a name="module_container_definition_fluentbit"></a> [container\_definition\_fluentbit](#module\_container\_definition\_fluentbit) | cloudposse/ecs-container-definition/aws | 0.58.3 |
| <a name="module_ecr"></a> [ecr](#module\_ecr) | terraform-aws-modules/ecr/aws | 1.6.0 |
| <a name="module_ecr_label"></a> [ecr\_label](#module\_ecr\_label) | justtrackio/label/null | 0.26.0 |
| <a name="module_ecs_label"></a> [ecs\_label](#module\_ecs\_label) | justtrackio/label/null | 0.26.0 |
| <a name="module_ecs_service_task_customized_autoscaling"></a> [ecs\_service\_task\_customized\_autoscaling](#module\_ecs\_service\_task\_customized\_autoscaling) | justtrackio/ecs-autoscaling/aws | 1.1.0 |
| <a name="module_ecs_service_task_predefined_autoscaling"></a> [ecs\_service\_task\_predefined\_autoscaling](#module\_ecs\_service\_task\_predefined\_autoscaling) | justtrackio/ecs-autoscaling/aws | 1.1.0 |
| <a name="module_ecs_service_task_schedule"></a> [ecs\_service\_task\_schedule](#module\_ecs\_service\_task\_schedule) | justtrackio/ecs-autoscaling/aws | 1.1.0 |
| <a name="module_monitoring"></a> [monitoring](#module\_monitoring) | justtrackio/ecs-gosoline-monitoring/aws | 2.0.1 |
| <a name="module_sentry"></a> [sentry](#module\_sentry) | justtrackio/project/sentry | 1.1.1 |
| <a name="module_service_task"></a> [service\_task](#module\_service\_task) | justtrackio/ecs-alb-service-task/aws | 1.2.0 |
| <a name="module_ssm_label"></a> [ssm\_label](#module\_ssm\_label) | justtrackio/label/null | 0.26.0 |
| <a name="module_this"></a> [this](#module\_this) | justtrackio/label/null | 0.26.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_ecs_cluster.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecs_cluster) | data source |
| [aws_lb.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb) | data source |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb_listener) | data source |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/lb_listener) | data source |
| [aws_ssm_parameter.container_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.container_memory_reservation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.container_tag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.grafana_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.sentry_token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tag_map"></a> [additional\_tag\_map](#input\_additional\_tag\_map) | Additional key-value pairs to add to each map in `tags_as_list_of_maps`. Not added to `tags` or `id`.<br>This is for some rare cases where resources want additional configuration of tags<br>and therefore take a list of maps with tag key, value, and additional configuration. | `map(string)` | `{}` | no |
| <a name="input_alarm_consumer"></a> [alarm\_consumer](#input\_alarm\_consumer) | This can be used to override alarms for consumers. Keys are names of the consumers. | <pre>object({<br>    alarm_description      = optional(string)<br>    datapoints_to_alarm    = optional(number, 1)<br>    evaluation_periods     = optional(number, 1)<br>    period                 = optional(number, 60)<br>    success_rate_threshold = optional(number, 99)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_enabled"></a> [alarm\_enabled](#input\_alarm\_enabled) | Defines if alarms should be created | `bool` | `false` | no |
| <a name="input_alarm_gateway"></a> [alarm\_gateway](#input\_alarm\_gateway) | This can be used to override alarms for gateway routes. Keys are names of the gateway route. | <pre>object({<br>    alarm_description      = optional(string)<br>    datapoints_to_alarm    = optional(number, 3)<br>    evaluation_periods     = optional(number, 3)<br>    period                 = optional(number, 60)<br>    success_rate_threshold = optional(number, 99)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_kinsumer"></a> [alarm\_kinsumer](#input\_alarm\_kinsumer) | This can be used to override alarms for kinsumers. Keys are names of the kinsumers. | <pre>object({<br>    alarm_description        = optional(string)<br>    datapoints_to_alarm      = optional(number, 1)<br>    evaluation_periods       = optional(number, 1)<br>    period                   = optional(number, 60)<br>    threshold_seconds_behind = optional(number, 60)<br>  })</pre> | `{}` | no |
| <a name="input_alarm_scheduled"></a> [alarm\_scheduled](#input\_alarm\_scheduled) | This can be used to override scheduled alarm | <pre>object({<br>    alarm_description   = optional(string)<br>    datapoints_to_alarm = optional(number, 1)<br>    evaluation_periods  = optional(number, 1)<br>    period              = optional(number, 60)<br>    threshold           = optional(number, 0)<br>  })</pre> | `{}` | no |
| <a name="input_alb_health_check_interval"></a> [alb\_health\_check\_interval](#input\_alb\_health\_check\_interval) | The duration in seconds in between health checks | `number` | `30` | no |
| <a name="input_alb_health_check_matcher"></a> [alb\_health\_check\_matcher](#input\_alb\_health\_check\_matcher) | The HTTP response codes to indicate a healthy check | `string` | `"200"` | no |
| <a name="input_alb_health_check_path"></a> [alb\_health\_check\_path](#input\_alb\_health\_check\_path) | The destination for the health check request | `string` | `"/health"` | no |
| <a name="input_alb_name"></a> [alb\_name](#input\_alb\_name) | Name of the alb used to attach the target group | `string` | `""` | no |
| <a name="input_alb_stickiness_enabled"></a> [alb\_stickiness\_enabled](#input\_alb\_stickiness\_enabled) | Boolean to enable / disable `stickiness`. Default is `true` | `bool` | `false` | no |
| <a name="input_alb_unauthenticated_hosts"></a> [alb\_unauthenticated\_hosts](#input\_alb\_unauthenticated\_hosts) | Unauthenticated hosts to match in Hosts header | `list(string)` | `[]` | no |
| <a name="input_alb_unauthenticated_paths"></a> [alb\_unauthenticated\_paths](#input\_alb\_unauthenticated\_paths) | Unauthenticated path pattern to match (a maximum of 1 can be defined) | `list(string)` | `[]` | no |
| <a name="input_alb_unauthenticated_priority"></a> [alb\_unauthenticated\_priority](#input\_alb\_unauthenticated\_priority) | The priority for the rules without authentication, between 1 and 50000 (1 being highest priority). Must be different from `authenticated_priority` since a listener can't have multiple rules with the same priority | `number` | `100` | no |
| <a name="input_app_image_tag"></a> [app\_image\_tag](#input\_app\_image\_tag) | The default container image to use in container definition | `string` | `null` | no |
| <a name="input_attributes"></a> [attributes](#input\_attributes) | ID element. Additional attributes (e.g. `workers` or `cluster`) to add to `id`,<br>in the order they appear in the list. New attributes are appended to the<br>end of the list. The elements of the list are joined by the `delimiter`<br>and treated as a single ID element. | `list(string)` | `[]` | no |
| <a name="input_autoscaling_customized_metric_name"></a> [autoscaling\_customized\_metric\_name](#input\_autoscaling\_customized\_metric\_name) | The name of the metric | `string` | `""` | no |
| <a name="input_autoscaling_customized_statistic"></a> [autoscaling\_customized\_statistic](#input\_autoscaling\_customized\_statistic) | The name of the metric | `string` | `"Average"` | no |
| <a name="input_autoscaling_customized_unit"></a> [autoscaling\_customized\_unit](#input\_autoscaling\_customized\_unit) | The name of the metric | `string` | `"Count"` | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Defines if autoscaling should be enabled | `bool` | `false` | no |
| <a name="input_autoscaling_max_capacity"></a> [autoscaling\_max\_capacity](#input\_autoscaling\_max\_capacity) | Maximum number of running instances of a Service | `number` | `200` | no |
| <a name="input_autoscaling_min_capacity"></a> [autoscaling\_min\_capacity](#input\_autoscaling\_min\_capacity) | Minimum number of running instances of a Service | `number` | `1` | no |
| <a name="input_autoscaling_predefined_metric_type"></a> [autoscaling\_predefined\_metric\_type](#input\_autoscaling\_predefined\_metric\_type) | The metric type | `string` | `null` | no |
| <a name="input_autoscaling_predefined_resource_label"></a> [autoscaling\_predefined\_resource\_label](#input\_autoscaling\_predefined\_resource\_label) | Needs lb arn suffix and target group arn suffix | `string` | `null` | no |
| <a name="input_autoscaling_scale_in_cooldown"></a> [autoscaling\_scale\_in\_cooldown](#input\_autoscaling\_scale\_in\_cooldown) | The amount of time, in seconds, after a scale in activity completes before another scale in activity can start | `number` | `60` | no |
| <a name="input_autoscaling_scale_out_cooldown"></a> [autoscaling\_scale\_out\_cooldown](#input\_autoscaling\_scale\_out\_cooldown) | The amount of time, in seconds, after a scale out activity completes before another scale out activity can start | `number` | `60` | no |
| <a name="input_autoscaling_schedule"></a> [autoscaling\_schedule](#input\_autoscaling\_schedule) | Provides an Application AutoScaling ScheduledAction resource | <pre>list(object({<br>    schedule     = string<br>    min_capacity = number<br>    max_capacity = number<br>  }))</pre> | `[]` | no |
| <a name="input_autoscaling_target_value"></a> [autoscaling\_target\_value](#input\_autoscaling\_target\_value) | The target value for the metric | `number` | `null` | no |
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account id | `string` | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region | `string` | `null` | no |
| <a name="input_circuit_breaker_deployment_enabled"></a> [circuit\_breaker\_deployment\_enabled](#input\_circuit\_breaker\_deployment\_enabled) | If `true`, enable the deployment circuit breaker logic for the service | `bool` | `false` | no |
| <a name="input_circuit_breaker_rollback_enabled"></a> [circuit\_breaker\_rollback\_enabled](#input\_circuit\_breaker\_rollback\_enabled) | If `true`, Amazon ECS will roll back the service if a service deployment fails | `bool` | `false` | no |
| <a name="input_cloudwatch_log_group_enabled"></a> [cloudwatch\_log\_group\_enabled](#input\_cloudwatch\_log\_group\_enabled) | A boolean to disable cloudwatch log group creation | `bool` | `true` | no |
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | The vCPU setting to control cpu limits of container. (If FARGATE launch type is used below, this must be a supported vCPU size from the table here: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-cpu-memory-error.html) | `number` | `128` | no |
| <a name="input_container_map_environment"></a> [container\_map\_environment](#input\_container\_map\_environment) | The environment variables to pass to the container. This is a map of string: {key: value}. `environment` overrides `map_environment` | `map(string)` | `null` | no |
| <a name="input_container_map_secrets"></a> [container\_map\_secrets](#input\_container\_map\_secrets) | The secrets variables to pass to the container. This is a map of string: {key: value}. map\_secrets overrides secrets | `map(string)` | `null` | no |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | The amount of RAM to allow container to use in MB. (If FARGATE launch type is used below, this must be a supported Memory size from the table here: https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-cpu-memory-error.html) | `number` | `null` | no |
| <a name="input_container_memory_reservation"></a> [container\_memory\_reservation](#input\_container\_memory\_reservation) | The amount of RAM (Soft Limit) to allow container to use in MB. This value must be less than `container_memory` if set | `number` | `128` | no |
| <a name="input_container_start_timeout"></a> [container\_start\_timeout](#input\_container\_start\_timeout) | Time duration (in seconds) to wait before giving up on resolving dependencies for a container | `number` | `null` | no |
| <a name="input_container_stop_timeout"></a> [container\_stop\_timeout](#input\_container\_stop\_timeout) | Time duration (in seconds) to wait before the container is forcefully killed if it doesn't exit normally on its own | `number` | `null` | no |
| <a name="input_context"></a> [context](#input\_context) | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "descriptor_formats": {},<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "labels_as_tags": [<br>    "unset"<br>  ],<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {},<br>  "tenant": null<br>}</pre> | no |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Delimiter to be used between ID elements.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| <a name="input_deployment_maximum_percent"></a> [deployment\_maximum\_percent](#input\_deployment\_maximum\_percent) | The upper limit of the number of tasks (as a percentage of `desired_count`) that can be running in a service during a deployment | `number` | `200` | no |
| <a name="input_deployment_minimum_healthy_percent"></a> [deployment\_minimum\_healthy\_percent](#input\_deployment\_minimum\_healthy\_percent) | The lower limit (as a percentage of `desired_count`) of the number of tasks that must remain running and healthy in a service during a deployment | `number` | `100` | no |
| <a name="input_descriptor_formats"></a> [descriptor\_formats](#input\_descriptor\_formats) | Describe additional descriptors to be output in the `descriptors` output map.<br>Map of maps. Keys are names of descriptors. Values are maps of the form<br>`{<br>   format = string<br>   labels = list(string)<br>}`<br>(Type is `any` so the map values can later be enhanced to provide additional options.)<br>`format` is a Terraform format string to be passed to the `format()` function.<br>`labels` is a list of labels, in order, to pass to `format()` function.<br>Label values will be normalized before being passed to `format()` so they will be<br>identical to how they appear in `id`.<br>Default is `{}` (`descriptors` output will be empty). | `any` | `{}` | no |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The desired number of tasks to start with. Set this to 0 if using DAEMON Service type. (FARGATE does not suppoert DAEMON Service type) | `number` | `1` | no |
| <a name="input_docker_labels"></a> [docker\_labels](#input\_docker\_labels) | The configuration options to send to the `docker_labels` | `map(string)` | `null` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | The default domain | `string` | n/a | yes |
| <a name="input_elasticsearch_host"></a> [elasticsearch\_host](#input\_elasticsearch\_host) | Defines the elasticsearch host to query for logs | `string` | `null` | no |
| <a name="input_elasticsearch_index_template"></a> [elasticsearch\_index\_template](#input\_elasticsearch\_index\_template) | This defines the properties used within the index template (Only used if create\_elasticsearch\_data\_stream is true) | <pre>object({<br>    additional_fields  = map(any)<br>    name               = string<br>    priority           = number<br>    node_name          = string<br>    number_of_shards   = number<br>    number_of_replicas = number<br>  })</pre> | <pre>{<br>  "additional_fields": {},<br>  "name": "",<br>  "node_name": "*",<br>  "number_of_replicas": 1,<br>  "number_of_shards": 1,<br>  "priority": 250<br>}</pre> | no |
| <a name="input_elasticsearch_lifecycle_policy"></a> [elasticsearch\_lifecycle\_policy](#input\_elasticsearch\_lifecycle\_policy) | This defines the properties used within the index lifecycle management policy (Only used if create\_elasticsearch\_data\_stream is true) | <pre>object({<br>    delete_phase_min_age             = string<br>    hot_phase_max_primary_shard_size = string<br>    hot_phase_max_age                = optional(string)<br>    warm_phase_min_age               = string<br>    warm_phase_number_of_replicas    = number<br>  })</pre> | <pre>{<br>  "delete_phase_min_age": "28d",<br>  "hot_phase_max_primary_shard_size": "10gb",<br>  "warm_phase_min_age": "1d",<br>  "warm_phase_number_of_replicas": 0<br>}</pre> | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| <a name="input_exec_enabled"></a> [exec\_enabled](#input\_exec\_enabled) | Specifies whether to enable Amazon ECS Exec for the tasks within the service | `bool` | `true` | no |
| <a name="input_gosoline_metadata"></a> [gosoline\_metadata](#input\_gosoline\_metadata) | Define custom metadata for the gosoline provider | <pre>object({<br>    domain    = optional(string),<br>    use_https = optional(string),<br>    port      = optional(string)<br>  })</pre> | `null` | no |
| <a name="input_gosoline_name_patterns"></a> [gosoline\_name\_patterns](#input\_gosoline\_name\_patterns) | Define custom name patters for the gosoline provider | <pre>object({<br>    hostname                         = optional(string),<br>    cloudwatch_namespace             = optional(string),<br>    ecs_cluster                      = optional(string),<br>    ecs_service                      = optional(string),<br>    grafana_elasticsearch_datasource = optional(string)<br>  })</pre> | <pre>{<br>  "cloudwatch_namespace": "{env}/{group}/{app}",<br>  "ecs_cluster": "{env}",<br>  "ecs_service": "{group}-{app}",<br>  "grafana_elasticsearch_datasource": "elasticsearch-{env}-logs-{group}-{app}",<br>  "hostname": "{scheme}://{app}.{group}.{env}.{metadata_domain}:{port}"<br>}</pre> | no |
| <a name="input_grafana_dashboard_url"></a> [grafana\_dashboard\_url](#input\_grafana\_dashboard\_url) | Url of the grafana dashboard | `string` | `null` | no |
| <a name="input_healthcheck"></a> [healthcheck](#input\_healthcheck) | A map containing command (string), timeout, interval (duration in seconds), retries (1-10, number of times to retry before marking container unhealthy), and startPeriod (0-300, optional grace period to wait, in seconds, before failed healthchecks count toward retries) | <pre>object({<br>    command     = list(string)<br>    retries     = number<br>    timeout     = number<br>    interval    = number<br>    startPeriod = number<br>  })</pre> | `null` | no |
| <a name="input_id_length_limit"></a> [id\_length\_limit](#input\_id\_length\_limit) | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for keep the existing setting, which defaults to `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| <a name="input_ignore_changes_desired_count"></a> [ignore\_changes\_desired\_count](#input\_ignore\_changes\_desired\_count) | Whether to ignore changes for desired count in the ECS service | `bool` | `true` | no |
| <a name="input_ignore_changes_task_definition"></a> [ignore\_changes\_task\_definition](#input\_ignore\_changes\_task\_definition) | Ignore changes (like environment variables) to the ECS task definition | `bool` | `false` | no |
| <a name="input_label_key_case"></a> [label\_key\_case](#input\_label\_key\_case) | Controls the letter case of the `tags` keys (label names) for tags generated by this module.<br>Does not affect keys of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | The order in which the labels (ID elements) appear in the `id`.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 6 labels ("tenant" is the 6th), but at least one must be present. | `list(string)` | `null` | no |
| <a name="input_label_orders"></a> [label\_orders](#input\_label\_orders) | Overrides the `labels_order` for the different labels to modify ID elements appear in the `id` | <pre>object({<br>    cloudwatch    = optional(list(string), ["environment", "stage", "name"]),<br>    ecr           = optional(list(string)),<br>    ecs           = optional(list(string), ["stage", "name"]),<br>    ec2           = optional(list(string), ["environment", "stage", "name"]),<br>    iam           = optional(list(string)),<br>    sentry        = optional(list(string), ["stage", "name"]),<br>    ssm           = optional(list(string)),<br>    vpc           = optional(list(string)),<br>    elasticsearch = optional(list(string), ["environment", "stage", "name"])<br>  })</pre> | `{}` | no |
| <a name="input_label_value_case"></a> [label\_value\_case](#input\_label\_value\_case) | Controls the letter case of ID elements (labels) as included in `id`,<br>set as tag values, and output by this module individually.<br>Does not affect values of tags passed in via the `tags` input.<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Set this to `title` and set `delimiter` to `""` to yield Pascal Case IDs.<br>Default value: `lower`. | `string` | `null` | no |
| <a name="input_labels_as_tags"></a> [labels\_as\_tags](#input\_labels\_as\_tags) | Set of labels (ID elements) to include as tags in the `tags` output.<br>Default is to include all labels.<br>Tags with empty values will not be included in the `tags` output.<br>Set to `[]` to suppress all generated tags.<br>**Notes:**<br>  The value of the `name` tag, if included, will be the `id`, not the `name`.<br>  Unlike other `null-label` inputs, the initial setting of `labels_as_tags` cannot be<br>  changed in later chained modules. Attempts to change it will be silently ignored. | `set(string)` | <pre>[<br>  "default"<br>]</pre> | no |
| <a name="input_launch_type"></a> [launch\_type](#input\_launch\_type) | The ECS launch type (valid options: FARGATE or EC2) | `string` | `"EC2"` | no |
| <a name="input_log_driver"></a> [log\_driver](#input\_log\_driver) | The log driver to use for the container. If using Fargate launch type, only supported value is awslogs | `string` | `"awsfirelens"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | The number of days to retain logs for the log group | `number` | `1` | no |
| <a name="input_log_router_container_cpu"></a> [log\_router\_container\_cpu](#input\_log\_router\_container\_cpu) | The log router cpu reservation for the ECS task definition | `string` | `30` | no |
| <a name="input_log_router_container_memory_reservation"></a> [log\_router\_container\_memory\_reservation](#input\_log\_router\_container\_memory\_reservation) | The log router cpu reservation for the ECS task definition | `string` | `64` | no |
| <a name="input_log_router_image_repository"></a> [log\_router\_image\_repository](#input\_log\_router\_image\_repository) | Container registry repository url | `string` | n/a | yes |
| <a name="input_log_router_image_tag"></a> [log\_router\_image\_tag](#input\_log\_router\_image\_tag) | The default container image to use in container definition | `string` | `"stable"` | no |
| <a name="input_log_router_options"></a> [log\_router\_options](#input\_log\_router\_options) | The log router options to use | `map(string)` | <pre>{<br>  "config-file-type": "file",<br>  "config-file-value": "/fluent-bit/etc/extra.conf"<br>}</pre> | no |
| <a name="input_log_router_type"></a> [log\_router\_type](#input\_log\_router\_type) | The log router type to use | `string` | `"fluentbit"` | no |
| <a name="input_metric_enabled"></a> [metric\_enabled](#input\_metric\_enabled) | Defines if metrics should be written | `bool` | n/a | yes |
| <a name="input_monitoring_enabled"></a> [monitoring\_enabled](#input\_monitoring\_enabled) | Defines if the monitoring module should be created | `bool` | `true` | no |
| <a name="input_mpr_enabled"></a> [mpr\_enabled](#input\_mpr\_enabled) | Whether to use the StreamMprMessagesPerRunner metric for autoscaling (gosoline feature), see: https://github.com/justtrackio/gosoline | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | ID element. Usually the component or solution name, e.g. 'app' or 'jenkins'.<br>This is the only ID element not also included as a `tag`.<br>The "name" tag is set to the full `id` string. There is no tag with the value of the `name` input. | `string` | `null` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique | `string` | `null` | no |
| <a name="input_network_mode"></a> [network\_mode](#input\_network\_mode) | The network mode to use for the task. This is required to be `awsvpc` for `FARGATE` `launch_type` or `null` for `EC2` `launch_type` | `string` | `null` | no |
| <a name="input_ordered_placement_strategy"></a> [ordered\_placement\_strategy](#input\_ordered\_placement\_strategy) | Service level strategy rules that are taken into consideration during task placement.<br>List from top to bottom in order of precedence. The maximum number of ordered\_placement\_strategy blocks is 5.<br>See [`ordered_placement_strategy`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service#ordered_placement_strategy) | <pre>list(object({<br>    type  = string<br>    field = string<br>  }))</pre> | <pre>[<br>  {<br>    "field": "instanceId",<br>    "type": "spread"<br>  }<br>]</pre> | no |
| <a name="input_organizational_unit"></a> [organizational\_unit](#input\_organizational\_unit) | Usually used to indicate the AWS organizational unit, e.g. 'prod', 'sdlc' | `string` | `null` | no |
| <a name="input_port_gateway"></a> [port\_gateway](#input\_port\_gateway) | Define the gateway port | `number` | `8088` | no |
| <a name="input_port_grpc"></a> [port\_grpc](#input\_port\_grpc) | Define the grpc port | `number` | `8081` | no |
| <a name="input_port_health"></a> [port\_health](#input\_port\_health) | Define the health port | `number` | `8090` | no |
| <a name="input_port_mappings"></a> [port\_mappings](#input\_port\_mappings) | The port mappings to configure for the container. This is a list of maps. Each map should contain "containerPort", "hostPort", and "protocol", where "protocol" is one of "tcp" or "udp". If using containers in a task with the awsvpc or host network mode, the hostPort can either be left blank or set to the same value as the containerPort | <pre>list(object({<br>    containerPort = number<br>    hostPort      = number<br>    protocol      = string<br>  }))</pre> | `[]` | no |
| <a name="input_port_metadata"></a> [port\_metadata](#input\_port\_metadata) | Define the metadata port | `number` | `8070` | no |
| <a name="input_regex_replace_chars"></a> [regex\_replace\_chars](#input\_regex\_replace\_chars) | Terraform regular expression (regex) string.<br>Characters matching the regex will be removed from the ID elements.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| <a name="input_service_placement_constraints"></a> [service\_placement\_constraints](#input\_service\_placement\_constraints) | The rules that are taken into consideration during task placement. Maximum number of placement\_constraints is 10. See [`placement_constraints`](https://www.terraform.io/docs/providers/aws/r/ecs_service.html#placement_constraints-1) docs | <pre>list(object({<br>    type       = string<br>    expression = string<br>  }))</pre> | `[]` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | ID element. Usually used to indicate role, e.g. 'prod', 'staging', 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `{'BusinessUnit': 'XYZ'}`).<br>Neither the tag keys nor the tag values will be modified by this module. | `map(string)` | `{}` | no |
| <a name="input_target_group_arn"></a> [target\_group\_arn](#input\_target\_group\_arn) | The ARN of the Target Group to which to route traffic | `string` | `""` | no |
| <a name="input_task_cpu"></a> [task\_cpu](#input\_task\_cpu) | The number of CPU units used by the task. If unspecified, it will default to `container_cpu`. If using `FARGATE` launch type `task_cpu` must match supported memory values (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size) | `number` | `null` | no |
| <a name="input_task_memory"></a> [task\_memory](#input\_task\_memory) | The amount of memory (in MiB) used by the task. If unspecified, it will default to `container_memory`. If using Fargate launch type `task_memory` must match supported cpu value (https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_size) | `number` | `null` | no |
| <a name="input_task_policy_arns"></a> [task\_policy\_arns](#input\_task\_policy\_arns) | A list of IAM Policy ARNs to attach to the generated task role. | `list(string)` | `[]` | no |
| <a name="input_tenant"></a> [tenant](#input\_tenant) | ID element \_(Rarely used, not included by default)\_. A customer identifier, indicating who this instance of a resource is for | `string` | `null` | no |
| <a name="input_tracing_enabled"></a> [tracing\_enabled](#input\_tracing\_enabled) | Defines if tracing should be enabled | `bool` | n/a | yes |
| <a name="input_ulimits"></a> [ulimits](#input\_ulimits) | The ulimits to configure for the container. This is a list of maps. Each map should contain "name", "softLimit" and "hardLimit" | <pre>list(object({<br>    name      = string<br>    softLimit = number<br>    hardLimit = number<br>  }))</pre> | `[]` | no |
| <a name="input_wait_for_steady_state"></a> [wait\_for\_steady\_state](#input\_wait\_for\_steady\_state) | If true, it will wait for the service to reach a steady state (like aws ecs wait services-stable) before continuing | `bool` | `true` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | The working directory to run commands inside the container | `string` | `"/app"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
