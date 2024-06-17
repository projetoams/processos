docker build -t php-hello-world .

docker run -d -p 8080:80 php-hello-world

ansible-playbook -i hosts.ini deploy-php-docker.yml
