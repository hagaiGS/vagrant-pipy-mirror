# This script configures and starts a PyPi mirror and http-server for cloudify offline

# Set start time so we know how long the bootstrap takes
T="$(date +%s)"
 # TODO: fix the env location
 # TODO: check installing nginx without sudo permissions

if [ -f /.installed ]
then
	echo 'Already installed.'
	source /home/vagrant/env/bin/activate

else
	echo ' INSTALLING '
	echo '------------'
	cd /home/vagrant
	sudo apt-get update -y
	sudo apt-get install python-pip python-dev build-essential -y
	sudo pip install --upgrade pip
	sudo pip install virtualenv
	sudo pip install --upgrade virtualenv
	sudo apt-get install nginx -y
	virtualenv env
	source /home/vagrant/env/bin/activate
	pip install -U devpi-server
	sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.original # backup the original
	sudo cp /vagrant/nginx.conf /etc/nginx/nginx.conf
	sudo touch /.installed # mark for the next 'vagrant up' that everything is already installed
	sudo nginx
fi
devpi-server --port 4040 --start
sudo nginx -s reload

# Print how long the bootstrap script took to run
T="$(($(date +%s)-T))"
echo "### Time bootstrap took: ${T} seconds ###"