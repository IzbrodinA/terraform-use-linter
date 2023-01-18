output "instance_id" {
  description = "ID of the EC2 instance"
  value       =  try(aws_instance.this[0].id, aws_spot_instance_request.this[0].id, "")
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       =  try(aws_instance.this[0].public_ip, aws_spot_instance_request.this[0].public_ip, "")
}