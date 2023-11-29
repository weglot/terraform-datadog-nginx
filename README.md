
![Datadog](https://imgix.datadoghq.com/img/about/presskit/logo-v/dd_vertical_purple.png)

[//]: # (This file is generated. Do not edit, module description can be added by editing / creating module_description.md)

# Terraform module for Datadog Nginx

This module is part of a larger suite of modules that provide alerts in Datadog.
Other modules can be found on the [Terraform Registry](https://registry.terraform.io/search/modules?namespace=kabisa&provider=datadog)

We have two base modules we use to standardise development of our Monitor Modules:
- [generic monitor](https://github.com/kabisa/terraform-datadog-generic-monitor) Used in 90% of our alerts
- [service check monitor](https://github.com/kabisa/terraform-datadog-service-check-monitor)

Modules are generated with this tool: https://github.com/kabisa/datadog-terraform-generator


[Module Variables](#module-variables)

Monitors:

| Monitor name    | Default enabled | Priority | Query                  |
|-----------------|------|----|------------------------|
| [Connection Dropped](#connection-dropped) | True | 2  | `avg(last_5m):max:nginx.net.conn_dropped_per_s{tag:xxx} by {service} > ` |
| [Requests Rate](#requests-rate) | True | 3  | `avg(last_30m):sum:nginx.net.request_per_s{tag:xxx} > ` |

# Getting started developing
[pre-commit](http://pre-commit.com/) was used to do Terraform linting and validating.

Steps:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

## Connection Dropped

Dropped connections should be at zero. If your rate of dropped connections per unit time starts to rise, look for possible resource saturation.

Query:
```terraform
avg(last_5m):max:nginx.net.conn_dropped_per_s{tag:xxx} by {service} > 
```

| variable                             | default                                  | required | description                      |
|--------------------------------------|------------------------------------------|----------|----------------------------------|
| connection_dropped_enabled           | True                                     | No       |                                  |
| connection_dropped_warning           | None                                     | No       |                                  |
| connection_dropped_critical          | 0                                        | No       |                                  |
| connection_dropped_evaluation_period | last_5m                                  | No       |                                  |
| connection_dropped_note              | ""                                       | No       |                                  |
| connection_dropped_docs              | Dropped connections should be at zero. If your rate of dropped connections per unit time starts to rise, look for possible resource saturation. | No       |                                  |
| connection_dropped_filter_override   | ""                                       | No       |                                  |
| connection_dropped_alerting_enabled  | True                                     | No       |                                  |
| connection_dropped_priority          | 2                                        | No       | Number from 1 (high) to 5 (low). |


## Requests Rate

Query:
```terraform
avg(last_30m):sum:nginx.net.request_per_s{tag:xxx} > 
```

| variable                        | default  | required | description                      |
|---------------------------------|----------|----------|----------------------------------|
| requests_rate_enabled           | True     | No       |                                  |
| requests_rate_warning           | None     | No       |                                  |
| requests_rate_critical          |          | Yes      |                                  |
| requests_rate_evaluation_period | last_30m | No       |                                  |
| requests_rate_note              | ""       | No       |                                  |
| requests_rate_docs              | ""       | No       |                                  |
| requests_rate_filter_override   | ""       | No       |                                  |
| requests_rate_alerting_enabled  | True     | No       |                                  |
| requests_rate_priority          | 3        | No       | Number from 1 (high) to 5 (low). |


## Status Check

| variable                      | default  | required | description  |
|-------------------------------|----------|----------|--------------|
| status_check_enabled          | True     | No       |              |
| status_check_alerting_enabled | True     | No       |              |


## Module Variables

| variable             | default  | required | description  |
|----------------------|----------|----------|--------------|
| filter_str           |          | Yes      |              |
| env                  |          | Yes      |              |
| service              |          | Yes      |              |
| service_display_name | None     | No       |              |
| notification_channel |          | Yes      |              |
| additional_tags      | []       | No       |              |
| name_prefix          | ""       | No       |              |
| name_suffix          | ""       | No       |              |


