sudo apt-get update;
sudo apt-get -y install mongodb;
sudo service mongodb stop;
sudo mkdir $HOME/db; 
sudo mongod --dbpath $HOME/db --port 80 --fork --logpath /var/tmp/mongodb;