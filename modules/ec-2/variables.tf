variable "instance_count" {
  description = "Number of EC2 instances to deploy"
  type        = number
  default     = 3
  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 4 && floor(var.instance_count) == var.instance_count
    error_message = "Accepted values: 1 - 4."
  }
}

variable "instance_type" {
  description = "Type of EC2 instance to use"
  type        = string
  validation {
    condition     = length(var.instance_type) > 3 && substr(var.instance_type, 0, 2) == "t2"
    error_message = "Support only t2 type."
  }
}

variable "subnet_ids" {
  description = "Subnet IDs for EC2 instances"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security group IDs for EC2 instances"
  type        = list(string)
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "GridU"
}

variable "environment" {
  description = "Name of the environment"
  type        = string
  default     = "test"
}

variable "instance_profile" {
  description = "ARN of the profile"
  type        = string
  default     = null
}
