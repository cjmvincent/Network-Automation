# to get started simply run:
# bash -c "$(wget -qO - https://raw.githubusercontent.com/cjmvincent/Ansible/main/install.sh)"


sudo apt update
sudo apt upgrade -y


# add required repositories
sudo add-apt-repository --yes universe
sudo add-apt-repository --yes ppa:ansible/ansible
sudo add-apt-repository --yes ppa:deadsnakes/ppa

sudo apt update
sudo apt upgrade -y


# install libs, dependencies, and apps
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev net-tools python3-pip python3-yaml python3-jinja2 python3-httplib2 python3-netaddr python3-paramiko python3-pkg-resources libffi-dev python3-all-dev python3-mysqldb python3-selinux python3-boto python3 python3-pip ansible wget software-properties-common git-core ansible -y

sudo apt update
sudo apt upgrade -y

pip install paramiko netmiko napalm pywinrm


# clone repo to ansible directory
cd /etc/ansible
sudo rm * -rf
sudo git clone https://github.com/cjmvincent/Ansible.git .


# install desired ansible collections
ansible-galaxy collection isntall cisco.ios


# install and create site (instance) of checkmk
cd /tmp/
wget https://download.checkmk.com/checkmk/1.6.0p27/check-mk-raw-1.6.0p27_0.focal_amd64.deb
sudo apt install -y ./check-mk-raw-1.6.0p27_0.focal_amd64.deb

sudo omd create your_site_name > ~/Desktop/checkmkcreds.txt
sudo omd start your_site_name


# configure firewall
sudo ufw enable

sudo ufw allow ssh
sudo ufw allow apache
