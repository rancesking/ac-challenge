# Terraform Proyect

## Description

This is a Terraform proyect to deploy a AWS infrastructure with ECS, RDS, VPC, ALB and a Bastion Hosts.

## Inputs

| Variable Name | Description | Type | Default | Required |
| --- | --- | --- | --- | --- |
| <a name="region"></a> `region` | Region where the instances be deployed | `string` | `us-east-1` | No |
| <a name="env"></a> `env` | The ID of the environment | `string` | `dev` | **Yes** |
| <a name="instance_os"></a> `instance_os` | The OS to use for the EC2 instances | `string` | `amazonlinux` | No |
| <a name="instance_type"></a> `instance_type` | The real EC2 instance type to be used | `string` | `medium` | No |
| <a name="instance_count"></a> `instance_count` | The number of EC2 instances to launch | `string` | `1` | No |
| <a name="cli_user"></a> `cli_user` | The Applaudos Cloud CLI user owner of the resource created | `string` | `Testing` | **Yes** |
| <a name="service"></a> `service` | The Applaudos Cloud CLI service running in this module | `string` | `VM` | No |


## Output Variables

| Output Name | Description | Example |
| --- | --- | --- |
| `public_ip_addresses` | The public IP addresses of the EC2 instances | `["10.0.0.1", "10.0.0.2"]` |
| `user` | The user of the EC2 instance running | `ec2-user` |
| `pass` | The password of the user of the EC2 instance running | `Q#%123kjhsd` |
| `instances_names` | The name of the EC2 instances running  | `["dev-tester-01", "dev-tester-02]` |