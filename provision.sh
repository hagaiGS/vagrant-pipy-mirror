# This script configures and starts a PyPi mirror and http-server for cloudify offline

sudo apt-get update -y
sudo apt-get install python-pip python-dev build-essential -y
sudo pip install --upgrade pip
sudo pip install virtualenv
sudo pip install --upgrade virtualenv
sudo apt-get install nginx -y
virtualenv env
source env/bin/activate
pip install -U devpi-server
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.original # backup the original
sudo cp nginx.conf /etc/nginx/nginx.conf
devpi-server --port 4040 --start
sudo nginx -s reload