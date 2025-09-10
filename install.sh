# to get started simply run:
# bash -c "$(wget -qO - https://raw.githubusercontent.com/cjmvincent/Network-Automation/main/install.sh)"

###############################################################################
# Packages                                                                    #
###############################################################################

echo "Making preperations..."
echo ""

# just to make sure all packages are so fresh and so clean
sudo apt update && sudo apt upgrade --yes

echo "Installing a handful of packages needed for my particular set up..."
echo ""

# install libs, dependencies, and apps
xargs sudo apt install -y < ./requirements/linux/requirements.txt

# pipx ensurepath

sudo apt update && sudo apt upgrade --yes

# install vscode
sudo snap install code --classic
sudo snap install postman

# pipx install -r ./requirements/python/requirements.txt


###############################################################################
# Net & DevOps                                                                #
###############################################################################

echo "Configuring python virtual enviroment for Ansible"
echo 

# mkdir ~/.venv
# python3 -m venv ~/.venv
# source ~/.venv/bin/activate

python3 -m pip install --upgrade pip
#python3 -m pip install --upgrade virtualenv

python3 -m pip install -r ./requirements/python/requirements.txt

echo "Cloning my network automation repo into my desired path..."
echo ""

# clone ansible repo to ansible directory
if [ -d "etc/ansible" ]; then
    sudo rm -rf /etc/ansible
fi

git clone https://github.com/cjmvincent/Network-Automation.git ~/ansible
sudo ln -s ~/ansible /etc/ansible

sudo rm /etc/hosts
sudo ls -s ~/ansible/dns_hosts /etc/hosts

# install desired ansible collections
ansible-galaxy install -r ./requirements/ansible/requirements.yml

#echo "Installing RunDeck..."

# install rundeck
#wget /url/to/file/rundeck.deb
#sudo dpkg -i /path/to/file/rundeck.deb

# start rundeck
#sudo systemctl daemon-reload
#sudo service rundeckd start

echo "Configuring tftp..."
echo ""

# backup oriignal config file, ande mak e afew edits 
sudo cp /etc/default/tftpd-hpa /etc/default/tftpd-hpa.backup
sudo sed -i 's/TFTP_OPTIONS="--secure"/TFTP_OPTIONS="--secure --create"/' /etc/default/tftpd-hpa
#sudo sed -i 's/TFTP_DIRECTORY="/srv/tftp"/TFTP_DIRECTORY="srv/tftp"/' /etc/default/tftpd-hpa

# change permissions on the tftp directory so you can upload files to the directory
sudo chown -R tftp /srv/tftp

# restart tftp service
sudo service tftpd-hpa restart


###############################################################################
# Firewall                                                                    #
###############################################################################

echo "Configuring firewall to allow some ports for the services this node will run..."
echo ""

# configure firewall
sudo ufw enable

# allow ssh
sudo ufw allow ssh

# allow tftp port in firewall
sudo ufw allow 69/tcp

# allow rundeck port in firewall
sudo ufw allow 4440/tcp

