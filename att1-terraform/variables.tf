variable "aws_region" {
  description = "A região da AWS a ser utilizada"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "O bloco CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Blocos CIDR para sub-redes públicas"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "Zonas de disponibilidade para as sub-redes públicas"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Nome da chave SSH para acesso à instância"
  type        = string
  default     = "fiagro"
}

variable "ami_id" {
  description = "ID da AMI para a instância EC2"
  type        = string
  default     = "ami-04b70fa74e45c3917"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default = "backup-mariusso-teste"
}
