# to get started simply run:
# bash -c "$(wget -qO - https://raw.githubusercontent.com/cjmvincent/Network-Automation/main/install.sh)"

# just to make sure all packages and such are fresh
sudo apt update
sudo apt upgrade -y


# add required repositories for the packages and utilities I want to install
sudo add-apt-repository --yes universe
sudo add-apt-repository --yes ppa:ansible/ansible
sudo add-apt-repository --yes ppa:deadsnakes/ppa

sudo apt update
sudo apt upgrade -y


# install libs, dependencies, and apps
sudo apt install build-essential net-tools python3.8 ansible oftware-properties-common git-core ansible gufw -y

sudo apt update
sudo apt upgrade -y


pip install paramiko netmiko napalm pywinrm ansible-pylibssh


# clone ansilbe repo to ansible directory
cd /etc/ansible
sudo rm * -rf
sudo git clone https://github.com/cjmvincent/Network-Automation.git .


# install desired ansible collections
#ansible-galaxy collection install cisco.ios
#ansible-galaxy collection install paloaltonetworks.panos
#ansible-galaxy collection install arubanetworks.aoscx
#ansible-galaxy collection install arubanetworks.aos_switch


# install and create site (instance) of checkmk
#cd /tmp/
#wget https://download.checkmk.com/checkmk/1.6.0p27/check-mk-raw-1.6.0p27_0.focal_amd64.deb
#sudo apt install -y ./check-mk-raw-1.6.0p27_0.focal_amd64.deb
#sudo omd create your_site_name > ~/Desktop/checkmkcreds.txt
#sudo omd start your_site_name


# configure firewall
sudo ufw enable

sudo ufw allow ssh
sudo ufw allow apache
