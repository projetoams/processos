variable "ami_id" {
  description = "ID da AMI para a instância EC2"
  type        = string
  #default     = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  description = "Tipo da instância EC2"
  type        = string
  #default     = "t2.micro"
}

variable "key_name" {
  description = "Nome da chave SSH para acesso à instância"
  type        = string
  #default     = "fiagro"
}

variable "subnet_id" {
  description = "ID da sub-rede onde a instância EC2 será criada"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}
