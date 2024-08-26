# to get started simply run:
# bash -c "$(wget -qO - https://raw.githubusercontent.com/cjmvincent/Network-Automation/main/install.sh)"

###############################################################################
# General Updates & Maintenance                                               #
###############################################################################

# just to make sure all packages  are so fresh and so clean
sudo apt update && sudo apt upgrade --yes


# add required repositories for the packages and utilities I want to install
echo "deb [trusted=yes] https://ppa.ipinfo.net/ /" | sudo tee  "/etc/apt/sources.list.d/ipinfo.ppa.list"
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

sudo add-apt-repository --yes universe
sudo add-apt-repository --yes ppa:ansible/ansible
sudo add-apt-repository --yes ppa:deadsnakes/ppa

sudo apt update && sudo apt upgrade --yes


###############################################################################
# Dependencies & General Packages                                             #
###############################################################################

# install libs, dependencies, and apps
sudo apt install build-essential net-tools software-properties-common openjdk-11-jre-headless \
    curl zsh git \
    synaptic ansible tftpd-hpa \
    ipcalc ipinfo --yes

sudo apt update && sudo apt upgrade --yes

#update pip
#sudo pip install --upgrade pip
#sudo pip install --upgrade virtualenv

# install some network management tools
#pip install paramiko netmiko napalm pywinrm ansible ansible-pylibssh awxkit --user


# install vscode
sudo snap install code --classic
sudo snap install postman


###############################################################################
# Net & DevOps                                                                     #
###############################################################################

# clone ansilbe repo to ansible directory
if [! -d "~/.ansible"] then
    sudo mkdir ~/.ansible
fi

cd ~/.ansible
sudo rm * -rf
sudo git clone https://github.com/cjmvincent/Network-Automation.git .


# install desired ansible collections
#ansible-galaxy collection install cisco.ios
#ansible-galaxy collection install paloaltonetworks.panos
#ansible-galaxy collection install arubanetworks.aoscx
#ansible-galaxy collection install arubanetworks.aos_switch
#ansible-galaxy collection install ansible.windows
#ansible-galaxy colleciton install community.windows
#ansible-galaxy collection install microsoft.ad
#ansible-galaxy collection install checkmk.general

# install rundeck
wget /url/to/file/rundeck.deb
sudo dpkg -i /path/to/file/rundeck.deb

# start rundeck
sudo systemctl daemon-reload
sudo service rundeckd start

# backup oriignal config file 
sudo cp /etc/default/tftpd-hpa /etc/default/tftpd-hpa.backup
sudo sed -i 's/TFTP_OPTIONS="--secure"/TFTP_OPTIONS="--secure --create"/' /etc/default/tftpd-hpa
#sudo sed -i 's/TFTP_DIRECTORY="/srv/tftp"/TFTP_DIRECTORY="srv/tftp"/' /etc/default/tftpd-hpa

# change permissions on the tftp directory so you can upload files to the directory
sudo chwown -R tftp /srv/tftp

# restart tftp service
sudo service tftpd-hpa restart


###############################################################################
# Terminal                                                                    #
###############################################################################

# # install ohmyzsh
# if test ! $(which omz); then
#   /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
# fi

# # Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
# rm -rf $HOME/.zshrc
# ln -s .zshrc $HOME/.zshrc%          


###############################################################################
# Firewall                                                                    #
###############################################################################

# configure firewall
sudo ufw enable

# allow ssh
sudo ufw allow ssh

# allow tftp port in firewall
sudo ufw allow 69/tcp

# allow rundeck port in firewall
sudo ufw allow 4440/tcp