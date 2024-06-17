resource "aws_security_group" "my_ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_ec2_sg"
  }
}

resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [aws_security_group.my_ec2_sg.id]

  user_data = <<-EOF
    #!/bin/bash

    #Instalando o PostgreSQL
    sudo apt-get update
    sudo apt-get install -y postgresql-13
    sudo apt -y install vim bash-completion wget 
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" |sudo tee  /etc/apt/sources.list.d/pgdg.list
    sudo apt update
    sudo apt install -y postgresql-13 postgresql-client-13


    #Instalando do Docker
    sudo apt-get install -y docker.io

    #Criando Dockerfile
    cat <<'DOCKERFILE_EOF' | sudo tee /home/ubuntu/Dockerfile
    FROM php:7.4-apache
    COPY ./html /var/www/html
    EXPOSE 80
    DOCKERFILE_EOF

    #Criando diretório para arquivos do Apache
    sudo mkdir /home/ubuntu/html

    #Build da imagem Docker
    sudo docker build -t apache-php-image /home/ubuntu

    #Executando o docker
    sudo docker run -d -p 80:80 apache-php-image
  EOF


  tags = {
    Name = "my_ec2"
  }
}

