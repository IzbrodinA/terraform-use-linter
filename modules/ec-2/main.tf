resource "aws_instance" "this" {
  count = !var.create_spot_instance ? var.number_instances : 0

  ami                  = var.ami
  instance_type        = var.instance_type
  monitoring           = true
  ebs_optimized        = true
  iam_instance_profile = "test"
  subnet_id            = aws_subnet.my_subnet.id
  vpc_security_group_ids = toset([aws_default_security_group.default.id])

  tags = {
    Name = var.instance_name
  }
  root_block_device {
    encrypted = true
  }
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}

resource "aws_spot_instance_request" "this" {
  count         = var.create_spot_instance ? var.number_instances : 0
  ami           = var.ami
  instance_type = var.instance_type
  tags          = {
    Name = var.instance_name
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_flow_log" "example" {
  iam_role_arn    = var.iam_role_name
  log_destination = var.log_destination
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.my_vpc.id
}