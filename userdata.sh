#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
sudo echo '<h1>RAC DEMO APPLICATION</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>RAC WELCOME DEMO</h1> <p>vRA, Terraform Demo</p> </body></html>' | sudo tee /var/www/html/app1/index.html