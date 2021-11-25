sudo yum update -y
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
sudo yum install -y httpd mariadb-server
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<h1>Hello, world</h1>" > /var/www/index.html
sudo usermod -a -G apache $(whoami)
sudo chown apache:apache /var/www/index.html
sudo chmod 660 /var/www/index.html