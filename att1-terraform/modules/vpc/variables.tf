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
