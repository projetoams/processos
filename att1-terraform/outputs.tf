output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs das sub-redes públicas"
  value       = module.vpc.public_subnet_ids
}

output "instance_id" {
  description = "ID da instância EC2 criada"
  value       = module.ec2.instance_id
}

output "instance_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = module.ec2.instance_public_ip
}

output "bucket_name" {
  description = "Nome do bucket S3"
  value       = module.s3.bucket_name
}
