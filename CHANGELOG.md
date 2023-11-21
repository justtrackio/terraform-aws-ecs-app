## [2.7.5](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.7.4...v2.7.5) (2023-11-21)


### Bug Fixes

* enable custom autoscaling based on type ([#71](https://github.com/justtrackio/terraform-aws-ecs-app/issues/71)) ([662e0d0](https://github.com/justtrackio/terraform-aws-ecs-app/commit/662e0d03d41fd6774af0aef30c942be6b3b3b0d9))

## [2.7.4](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.7.3...v2.7.4) (2023-11-07)


### Bug Fixes

* update terraform gosoline to v1.2.4 ([#56](https://github.com/justtrackio/terraform-aws-ecs-app/issues/56)) ([8126636](https://github.com/justtrackio/terraform-aws-ecs-app/commit/8126636a57812ee9190b6f79305f86c3697e342a))

## [2.7.3](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.7.2...v2.7.3) (2023-11-01)


### Bug Fixes

* aws managed policy CloudWatchFullAccess becomes CloudWatchFullAc… ([#67](https://github.com/justtrackio/terraform-aws-ecs-app/issues/67)) ([7eedfe1](https://github.com/justtrackio/terraform-aws-ecs-app/commit/7eedfe1c0f4df1d2b14095bd8198354278a4d001))

## [2.7.2](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.7.1...v2.7.2) (2023-08-25)


### Bug Fixes

* missing-family-inside-grafana-elastic-pattern ([#55](https://github.com/justtrackio/terraform-aws-ecs-app/issues/55)) ([4f32c71](https://github.com/justtrackio/terraform-aws-ecs-app/commit/4f32c71ed7aafa201a232326c7f469e108f3a09c))

## [2.7.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.7.0...v2.7.1) (2023-08-24)


### Bug Fixes

* update elastic grafana datasource default ([#54](https://github.com/justtrackio/terraform-aws-ecs-app/issues/54)) ([b649a13](https://github.com/justtrackio/terraform-aws-ecs-app/commit/b649a135f8d954d4308cdf0c468a87f05fa12fa2))

## [2.7.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.6.0...v2.7.0) (2023-08-18)


### Features

* make-sentry-optional ([#49](https://github.com/justtrackio/terraform-aws-ecs-app/issues/49)) ([43a62b8](https://github.com/justtrackio/terraform-aws-ecs-app/commit/43a62b8e88c407671cbbbd2837c7540eec9f2149))

## [2.6.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.5.0...v2.6.0) (2023-08-16)


### Features

* allow to specify target group to register the service in as alt… ([#50](https://github.com/justtrackio/terraform-aws-ecs-app/issues/50)) ([9e4843a](https://github.com/justtrackio/terraform-aws-ecs-app/commit/9e4843a41e624f8d9f0b33c38c70ac9bbc2427fb))

## [2.5.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.4.0...v2.5.0) (2023-08-09)


### Features

* add default mpr metric naming pattern ([#47](https://github.com/justtrackio/terraform-aws-ecs-app/issues/47)) ([26303e4](https://github.com/justtrackio/terraform-aws-ecs-app/commit/26303e4d99c3488541d66abd6463932e9271471e))

## [2.4.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.3.3...v2.4.0) (2023-08-04)


### Features

* bumped ecs-alb-service-task module for secrets manager access ([#45](https://github.com/justtrackio/terraform-aws-ecs-app/issues/45)) ([0043e16](https://github.com/justtrackio/terraform-aws-ecs-app/commit/0043e16014f704f17a0a3640ca1f85c74369513f))

## [2.3.3](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.3.2...v2.3.3) (2023-08-03)


### Bug Fixes

* add-default-redis-naming-pattern ([#44](https://github.com/justtrackio/terraform-aws-ecs-app/issues/44)) ([8d9b415](https://github.com/justtrackio/terraform-aws-ecs-app/commit/8d9b415307df2f9ee45da21ac30ac3b90a73160a))

## [2.3.2](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.3.1...v2.3.2) (2023-08-01)


### Bug Fixes

* adjust-autoscaling-service-name ([#41](https://github.com/justtrackio/terraform-aws-ecs-app/issues/41)) ([ba7a68b](https://github.com/justtrackio/terraform-aws-ecs-app/commit/ba7a68bded086d8051b078d7876e6bbfb01824db))

## [2.3.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.3.0...v2.3.1) (2023-07-31)


### Bug Fixes

* get_lb_autoscaling_data_inside_module ([#40](https://github.com/justtrackio/terraform-aws-ecs-app/issues/40)) ([28ec418](https://github.com/justtrackio/terraform-aws-ecs-app/commit/28ec41850c0253f0885dec6407f2d42ba53d1d5a))

## [2.3.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.2.0...v2.3.0) (2023-07-28)


### Features

* add tag propagation ([#39](https://github.com/justtrackio/terraform-aws-ecs-app/issues/39)) ([98c6eb9](https://github.com/justtrackio/terraform-aws-ecs-app/commit/98c6eb930c79bcb16e5a3403e9124ed5ac224a9d))

## [2.2.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.1.1...v2.2.0) (2023-07-27)


### Features

* update_sentry_module ([#37](https://github.com/justtrackio/terraform-aws-ecs-app/issues/37)) ([038e705](https://github.com/justtrackio/terraform-aws-ecs-app/commit/038e705f4e7a77e20350aac95c51551fbaa443ec))

## [2.1.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.1.0...v2.1.1) (2023-07-27)


### Bug Fixes

* elasticsearch_host var not forwarded to gosoline-monitoring module ([#36](https://github.com/justtrackio/terraform-aws-ecs-app/issues/36)) ([7135f81](https://github.com/justtrackio/terraform-aws-ecs-app/commit/7135f819f5da11442f8e24af26d099e8842d31f9))

## [2.1.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.0.0...v2.1.0) (2023-07-27)


### Features

* update gosoline monitoring module to 2.1.1 ([#30](https://github.com/justtrackio/terraform-aws-ecs-app/issues/30)) ([b2514e0](https://github.com/justtrackio/terraform-aws-ecs-app/commit/b2514e023e442050411ef0c877ef90b0f4ffabcf))

## [2.0.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v1.1.0...v2.0.0) (2023-07-26)


### ⚠ BREAKING CHANGES

* add_common_capabilities (#21)

### Features

* add_common_capabilities ([#21](https://github.com/justtrackio/terraform-aws-ecs-app/issues/21)) ([850e210](https://github.com/justtrackio/terraform-aws-ecs-app/commit/850e210ed8594eae0beaca1f5a4ea8c55edbd4a2))

# Changelog

All notable changes to this project will be documented in this file.

## [1.1.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v1.0.0...v1.1.0) (2023-01-19)


### Features

* add label orders variable ([#10](https://github.com/justtrackio/terraform-aws-ecs-app/issues/10)) ([62cf41e](https://github.com/justtrackio/terraform-aws-ecs-app/commit/62cf41e7fb57a9281a3ef23e807b416e4d3a7963))

## 1.0.0 (2023-01-06)


### Features

* Added functionality ([#1](https://github.com/justtrackio/terraform-aws-ecs-app/issues/1)) ([5845865](https://github.com/justtrackio/terraform-aws-ecs-app/commit/58458658fc9f1630246aa362e85e12eb146e8fd5))
