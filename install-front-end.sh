sudo apt-get update;
sudo apt-get -y install git nodejs;
sudo update-alternatives --install /usr/bin/node nodejs /usr/bin/nodejs 100;
curl https://www.npmjs.org/install.sh | sudo sh;
git clone https://github.com/GoogleCloudPlatform/todomvc-mongodb.git;
cd todomvc-mongodb; 
npm install;
sudo npm install forever -g;
forever start server.js --be_ip $1 --fe_ip $2;


