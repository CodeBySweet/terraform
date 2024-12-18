#!/bin/bash
sudo dnf update -y
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

echo "<h1>Session-2 homework is complete!</h1>" > /var/www/html/index.html
