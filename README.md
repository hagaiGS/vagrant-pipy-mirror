vagrant-pipy-mirror
===================

vagrant environment to start a PyPi mirror + http server

To start a PyPi mirror + http-server on port 8080 simply ```vagrant up```
To use the PyPi mirror you can either use ```pip install -i http://localhost:8080/root/pypi/+simple <PACKAGE-NAME>,
or use the pip.conf configuration file - add this file on your local machine to ```~/.pip``` and you are set.
To add files to the http-server, ```vagrant ssh``` into the machine, and add the files to /home/vagrant/cloudify.
To access the files on the http-server go to ```http://localhost:8080/cloudify/<PATH-TO-FILE>```
