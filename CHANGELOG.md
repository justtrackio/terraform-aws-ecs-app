## [3.0.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.29.2...v3.0.0) (2024-11-26)


### ⚠ BREAKING CHANGES

* replace tracing_enabled with tracing_provider (#156)

### Features

* replace tracing_enabled with tracing_provider ([#156](https://github.com/justtrackio/terraform-aws-ecs-app/issues/156)) ([daeeb3f](https://github.com/justtrackio/terraform-aws-ecs-app/commit/daeeb3f85c41e197cf5739f39537d83d1afa34de))

## [2.29.2](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.29.1...v2.29.2) (2024-11-22)


### Bug Fixes

* update gosoline monitoring module ([d687548](https://github.com/justtrackio/terraform-aws-ecs-app/commit/d687548ff4f88bc772cccfd70503be1e2880cbf0))

## [2.29.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.29.0...v2.29.1) (2024-11-22)


### Bug Fixes

* change service resource alert default ([#155](https://github.com/justtrackio/terraform-aws-ecs-app/issues/155)) ([03bbb2d](https://github.com/justtrackio/terraform-aws-ecs-app/commit/03bbb2d0adaeaa6e2c376a776d26974e38e78fe5))

## [2.29.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.28.2...v2.29.0) (2024-11-19)


### Features

* add alarm levels ([#154](https://github.com/justtrackio/terraform-aws-ecs-app/issues/154)) ([1e48053](https://github.com/justtrackio/terraform-aws-ecs-app/commit/1e48053cb34eb0aac577c9562acd81433033a8ec))

## [2.28.2](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.28.1...v2.28.2) (2024-11-07)


### Bug Fixes

* image retention for latest ([#149](https://github.com/justtrackio/terraform-aws-ecs-app/issues/149)) ([ae8e217](https://github.com/justtrackio/terraform-aws-ecs-app/commit/ae8e21760fc14a56e498519c489520055a0dc7c0))

## [2.28.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.28.0...v2.28.1) (2024-10-29)


### Bug Fixes

* bump sentry version ([#145](https://github.com/justtrackio/terraform-aws-ecs-app/issues/145)) ([e59f84d](https://github.com/justtrackio/terraform-aws-ecs-app/commit/e59f84dd98218dbf1d27b42e2f671431823cb2e9))

## [2.28.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.27.0...v2.28.0) (2024-10-29)


### Features

* expose ecr repository lifecycle policy settings + keep 5 "deplo… ([#143](https://github.com/justtrackio/terraform-aws-ecs-app/issues/143)) ([077cd2b](https://github.com/justtrackio/terraform-aws-ecs-app/commit/077cd2b3042f75a9b715bb65f753124f2003bcff))

## [2.27.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.26.0...v2.27.0) (2024-10-18)


### Features

* add sentry alarms ([#141](https://github.com/justtrackio/terraform-aws-ecs-app/issues/141)) ([5f3dbb0](https://github.com/justtrackio/terraform-aws-ecs-app/commit/5f3dbb0fb0ef9384c1b3d6591b5f7fb6ff2006c5))

## [2.26.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.25.0...v2.26.0) (2024-10-11)


### Features

* skip faulty version for aws provider ([#137](https://github.com/justtrackio/terraform-aws-ecs-app/issues/137)) ([9d30c38](https://github.com/justtrackio/terraform-aws-ecs-app/commit/9d30c38535109555ec875e63b8e77e415a9fa8f8))

## [2.25.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.24.0...v2.25.0) (2024-08-22)


### Features

* autoscaling uses the new metric_calculator implemention from gosoline; ([#129](https://github.com/justtrackio/terraform-aws-ecs-app/issues/129)) ([2b9cc44](https://github.com/justtrackio/terraform-aws-ecs-app/commit/2b9cc441bc6584b418471658a9cd7d65dae5165b))

## [2.24.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.23.0...v2.24.0) (2024-08-02)


### Features

* expose alb health check settings ([#126](https://github.com/justtrackio/terraform-aws-ecs-app/issues/126)) ([66e0811](https://github.com/justtrackio/terraform-aws-ecs-app/commit/66e081184288a7bd51834f4bec02e31db22f1881))

## [2.23.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.22.0...v2.23.0) (2024-06-21)


### Features

* added kibana spaces and data views support for ecs monitoring m… ([#114](https://github.com/justtrackio/terraform-aws-ecs-app/issues/114)) ([73767d8](https://github.com/justtrackio/terraform-aws-ecs-app/commit/73767d886e949d16325de5f32f2584cd9840bb20))

## [2.22.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.21.0...v2.22.0) (2024-06-20)


### Features

* add log router dependency ([#119](https://github.com/justtrackio/terraform-aws-ecs-app/issues/119)) ([a5035fa](https://github.com/justtrackio/terraform-aws-ecs-app/commit/a5035fab160aeb8c96569af814436d48faf62b03))

## [2.21.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.20.1...v2.21.0) (2024-06-18)


### Features

* add ability to resolve services by CloudMap by default ([#117](https://github.com/justtrackio/terraform-aws-ecs-app/issues/117)) ([bbf1050](https://github.com/justtrackio/terraform-aws-ecs-app/commit/bbf1050d22ab529a90c38effc4748f323965aaef))

## [2.20.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.20.0...v2.20.1) (2024-05-29)


### Bug Fixes

* autoscaling when scheduled scaling is enabled ([#115](https://github.com/justtrackio/terraform-aws-ecs-app/issues/115)) ([a6555f1](https://github.com/justtrackio/terraform-aws-ecs-app/commit/a6555f16172d7a7a5542c3a9b1796218b299bef5))

## [2.19.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.19.0...v2.19.1) (2024-05-27)


### Bug Fixes

* update monitoring module to 2.3.2 to allow individual alarm configuration ([#116](https://github.com/justtrackio/terraform-aws-ecs-app/issues/116)) ([46cdc20](https://github.com/justtrackio/terraform-aws-ecs-app/commit/46cdc205524ad4518cd88e5a2de6d65f947a1591))

## [2.19.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.18.1...v2.19.0) (2024-05-13)


### Features

* bump alb-service-task module ([#113](https://github.com/justtrackio/terraform-aws-ecs-app/issues/113)) ([4472ee9](https://github.com/justtrackio/terraform-aws-ecs-app/commit/4472ee98c4915a26fc21e953bc2318d92449bd17))

## [2.18.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.18.0...v2.18.1) (2024-05-07)


### Bug Fixes

* kinsumers with same name crashed module ([#112](https://github.com/justtrackio/terraform-aws-ecs-app/issues/112)) ([61ef341](https://github.com/justtrackio/terraform-aws-ecs-app/commit/61ef341bf64c3d3f0effa216568e8ea26756b5c1))

## [2.18.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.17.0...v2.18.0) (2024-04-22)


### Features

* add resource alarm tags and severity to resource alarms ([#107](https://github.com/justtrackio/terraform-aws-ecs-app/issues/107)) ([b99a594](https://github.com/justtrackio/terraform-aws-ecs-app/commit/b99a5949a1e2355b83903359f4a7a27211b496c6))

## [2.17.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.16.1...v2.17.0) (2024-04-15)


### Features

* add kinesis policy ([#105](https://github.com/justtrackio/terraform-aws-ecs-app/issues/105)) ([4686ae0](https://github.com/justtrackio/terraform-aws-ecs-app/commit/4686ae0a8b1d294aa40c6786bffee6db96a1bed5))

## [2.16.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.16.0...v2.16.1) (2024-04-15)


### Bug Fixes

* increase consumer alarm datapoints ([#104](https://github.com/justtrackio/terraform-aws-ecs-app/issues/104)) ([c287e4f](https://github.com/justtrackio/terraform-aws-ecs-app/commit/c287e4f38a65e09d204a17ed53ff204d69af9c78))

## [2.16.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.15.0...v2.16.0) (2024-04-02)


### Features

* added service registries ([#99](https://github.com/justtrackio/terraform-aws-ecs-app/issues/99)) ([3c89602](https://github.com/justtrackio/terraform-aws-ecs-app/commit/3c89602dd7cdc8c2fdc8e7f05ce9c7343e11773d))

## [2.15.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.14.0...v2.15.0) (2024-04-02)


### Features

* remove grpc port ([#98](https://github.com/justtrackio/terraform-aws-ecs-app/issues/98)) ([a5a77a6](https://github.com/justtrackio/terraform-aws-ecs-app/commit/a5a77a61003ba0231e215908ac3ad782a45b9d00))

## [2.14.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.13.0...v2.14.0) (2024-03-12)


### Features

* update dependencies ([#95](https://github.com/justtrackio/terraform-aws-ecs-app/issues/95)) ([0abf4fd](https://github.com/justtrackio/terraform-aws-ecs-app/commit/0abf4fde1f778d90b08cd6530b7638c222d9d0df))

## [2.13.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.12.0...v2.13.0) (2024-02-28)


### Features

* keep the latest tag in ecr ([#94](https://github.com/justtrackio/terraform-aws-ecs-app/issues/94)) ([45bdcd5](https://github.com/justtrackio/terraform-aws-ecs-app/commit/45bdcd52b808cc9e04ff4646f9dc76969b755f06))

## [2.12.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.11.0...v2.12.0) (2024-02-14)


### Features

* update provider justtrackio/gosoline to 1.3.0 ([#89](https://github.com/justtrackio/terraform-aws-ecs-app/issues/89)) ([a98d9ff](https://github.com/justtrackio/terraform-aws-ecs-app/commit/a98d9ff4714c55bab416738580bec344f74f65a2))

## [2.11.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.10.2...v2.11.0) (2024-02-07)


### Features

* added health_check_grace_period_seconds parameter ([#85](https://github.com/justtrackio/terraform-aws-ecs-app/issues/85)) ([3f4be97](https://github.com/justtrackio/terraform-aws-ecs-app/commit/3f4be97de7ed2a82ef9ff5ba4e822fd4ea60ff1d))

## [2.10.2](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.10.1...v2.10.2) (2024-01-23)


### Bug Fixes

* change alarm_service_resources_enabled default ([#83](https://github.com/justtrackio/terraform-aws-ecs-app/issues/83)) ([b3a512f](https://github.com/justtrackio/terraform-aws-ecs-app/commit/b3a512fc785d9b42a1f7e6f015d45c15dfe2f4a9))

## [2.10.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.10.0...v2.10.1) (2024-01-18)


### Bug Fixes

* remove default container_memory ([#81](https://github.com/justtrackio/terraform-aws-ecs-app/issues/81)) ([4383729](https://github.com/justtrackio/terraform-aws-ecs-app/commit/43837293ce0c8c27d9454d088a4247ae6b534985))

## [2.10.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.9.0...v2.10.0) (2024-01-17)


### Features

* add alarm-service-resources module ([#80](https://github.com/justtrackio/terraform-aws-ecs-app/issues/80)) ([6a2d953](https://github.com/justtrackio/terraform-aws-ecs-app/commit/6a2d953d1d218b35775fae5e781d207270ae7dc8))

## [2.9.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.8.3...v2.9.0) (2024-01-11)


### Features

* add default resource request ([#77](https://github.com/justtrackio/terraform-aws-ecs-app/issues/77)) ([9e90318](https://github.com/justtrackio/terraform-aws-ecs-app/commit/9e9031815fbce52de181601637035277287ac1ec))

## [2.8.3](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.8.2...v2.8.3) (2024-01-08)


### Bug Fixes

* fixed resource_label statement in autoscaling.tf ([#78](https://github.com/justtrackio/terraform-aws-ecs-app/issues/78)) ([bb37a91](https://github.com/justtrackio/terraform-aws-ecs-app/commit/bb37a91e33425b87b05582edf9a7e869f931734b))

## [2.8.2](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.8.1...v2.8.2) (2023-12-13)


### Bug Fixes

* change sentry to https ([#76](https://github.com/justtrackio/terraform-aws-ecs-app/issues/76)) ([1263934](https://github.com/justtrackio/terraform-aws-ecs-app/commit/12639349dd19702fb4cc25b7044faf8eb0ee988a))

## [2.8.1](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.8.0...v2.8.1) (2023-11-21)


### Bug Fixes

* update terraform justtrackio/ecs-gosoline-monitoring/aws to v2.2.1 ([#72](https://github.com/justtrackio/terraform-aws-ecs-app/issues/72)) ([dde1b17](https://github.com/justtrackio/terraform-aws-ecs-app/commit/dde1b1799efdc821f0698131639a4b546a7da563))

## [2.8.0](https://github.com/justtrackio/terraform-aws-ecs-app/compare/v2.7.5...v2.8.0) (2023-11-21)


### Features

* update terraform justtrackio/ecs-gosoline-monitoring/aws to v2.2.0 ([#60](https://github.com/justtrackio/terraform-aws-ecs-app/issues/60)) ([ccda268](https://github.com/justtrackio/terraform-aws-ecs-app/commit/ccda2685312b850539ea3e416def548fdb490aed))

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
