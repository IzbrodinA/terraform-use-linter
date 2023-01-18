variable "ami" {
  type        = string
  description = "AMI ID for the EC2 instance"
  default     = "ami-830c94e3"

  validation {
    condition     = length(var.ami) > 4 && substr(var.ami, 0, 4) == "ami-"
    error_message = "Please provide a valid value for variable AMI."
  }
}

variable "instance_type" {
  type        = string
  description = "Instance type for the EC2 instance."
  default     = "t2.micro"

  validation {
    condition     = length(var.instance_type) > 3 && substr(var.instance_type, 0, 2) == "t2"
    error_message = "Support only t2 type."
  }
}

variable "instance_name" {
  type        = string
  description = "Name to be used on EC2 instance created"
  default     = "terraform-default-name"

  validation {
    condition     = length(var.instance_name) > 9 && substr(var.instance_name, 0, 9) == "terraform"
    error_message = "The service name must begin with the prefix terraform."
  }
}

variable "create_spot_instance" {
  description = "Depicts if the instance is a spot instance"
  type        = bool
  default     = false
  validation {
    condition = can(regex("^([t][r][u][e]|[f][a][l][s][e])$", var.create_spot_instance))
    error_message     = "The create_spot_instance must be either true or false."
  }
}

variable "number_instances" {
  description = "Number of instances. Maximum - 4"
  type        = number
  default     = 1

  validation {
    condition     = var.number_instances >= 1 && var.number_instances <= 4 && floor(var.number_instances) == var.number_instances
    error_message = "Accepted values: 1 - 4."
  }
}

variable "iam_role_name" {
  description = "Name to use on IAM role created"
  type        = string
  default     = null
}

variable "log_destination" {
  description = " Log destination"
  type        = string
  default     = null
}