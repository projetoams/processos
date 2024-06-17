output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  description = "IDs das sub-redes públicas"
  value       = aws_subnet.public_subnet[*].id
}
