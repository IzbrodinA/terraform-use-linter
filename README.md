# Terraform-Aleksei-Izbrodin
Created 3 ec-2 with ELB and Apache inside

Result:
![prove.png](prove.png)
![img.png](img.png)
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.22.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_security_group"></a> [app\_security\_group](#module\_app\_security\_group) | terraform-aws-modules/security-group/aws//modules/web | 4.9.0 |
| <a name="module_ec2_instances"></a> [ec2\_instances](#module\_ec2\_instances) | ./modules/ec-2 | n/a |
| <a name="module_elb_http"></a> [elb\_http](#module\_elb\_http) | terraform-aws-modules/elb/aws | 3.0.1 |
| <a name="module_lb_security_group"></a> [lb\_security\_group](#module\_lb\_security\_group) | terraform-aws-modules/security-group/aws//modules/web | 4.9.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.14.2 |

## Resources

| Name | Type |
|------|------|
| [aws_flow_log.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [random_string.lb_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region for all resources. | `string` | `"us-east-2"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name to use on IAM role created. | `string` | `null` | no |
| <a name="input_log_destination"></a> [log\_destination](#input\_log\_destination) | Log destination. | `string` | `null` | no |
| <a name="input_private_subnet_cidr_blocks"></a> [private\_subnet\_cidr\_blocks](#input\_private\_subnet\_cidr\_blocks) | Available cidr blocks for private subnets. | `list(string)` | <pre>[<br>  "10.0.101.0/24",<br>  "10.0.102.0/24",<br>  "10.0.103.0/24",<br>  "10.0.104.0/24",<br>  "10.0.105.0/24",<br>  "10.0.106.0/24",<br>  "10.0.107.0/24",<br>  "10.0.108.0/24",<br>  "10.0.109.0/24",<br>  "10.0.110.0/24",<br>  "10.0.111.0/24",<br>  "10.0.112.0/24",<br>  "10.0.113.0/24",<br>  "10.0.114.0/24",<br>  "10.0.115.0/24",<br>  "10.0.116.0/24"<br>]</pre> | no |
| <a name="input_project"></a> [project](#input\_project) | Map of project names to configuration. | `map(any)` | <pre>{<br>  "client-webapp": {<br>    "environment": "dev",<br>    "instance_type": "t2.micro",<br>    "instances_per_subnet": 3,<br>    "private_subnets_per_vpc": 1,<br>    "public_subnets_per_vpc": 1<br>  }<br>}</pre> | no |
| <a name="input_public_subnet_cidr_blocks"></a> [public\_subnet\_cidr\_blocks](#input\_public\_subnet\_cidr\_blocks) | Available cidr blocks for public subnets. | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24",<br>  "10.0.4.0/24",<br>  "10.0.5.0/24",<br>  "10.0.6.0/24",<br>  "10.0.7.0/24",<br>  "10.0.8.0/24",<br>  "10.0.9.0/24",<br>  "10.0.10.0/24",<br>  "10.0.11.0/24",<br>  "10.0.12.0/24",<br>  "10.0.13.0/24",<br>  "10.0.14.0/24",<br>  "10.0.15.0/24",<br>  "10.0.16.0/24"<br>]</pre> | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR block for VPC. | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | IDs of EC2 instances. |
| <a name="output_public_dns_names"></a> [public\_dns\_names](#output\_public\_dns\_names) | Public DNS names of the load balancers for project. |
| <a name="output_vpc_arns"></a> [vpc\_arns](#output\_vpc\_arns) | ARNs of the vpcs for each project. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
