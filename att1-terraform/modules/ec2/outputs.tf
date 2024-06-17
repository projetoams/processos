output "instance_id" {
  description = "ID da instância EC2 criada"
  value       = aws_instance.my_ec2.id
}

output "instance_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.my_ec2.public_ip
}
