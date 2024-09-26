# to get started simply run:
# bash -c "$(wget -qO - https://raw.githubusercontent.com/cjmvincent/Network-Automation/main/install.sh)"

###############################################################################
# General Updates & Maintenance                                               #
###############################################################################

echo "Updating packages, and adding a few repositories..."
echo ""

# just to make sure all packages are so fresh and so clean
sudo apt update && sudo apt upgrade --yes


# add required repositories for the packages and utilities I want to install for this project
echo "deb [trusted=yes] https://ppa.ipinfo.net/ /" | sudo tee  "/etc/apt/sources.list.d/ipinfo.ppa.list"
#sudo add-apt-repository --yes universe
#sudo add-apt-repository --yes ppa:deadsnakes/ppa

sudo apt update && sudo apt upgrade --yes


###############################################################################
# Dependencies & General Packages                                             #
###############################################################################

echo "Installing a handful of packages needed for my particular set up..."
echo ""

# install libs, dependencies, and apps
sudo apt install build-essential net-tools software-properties-common openjdk-11-jre-headless \
    curl zsh git gh \
    lsd bat \
    synaptic tftpd-hpa \
    ipcalc ipinfo speedtest-cli --yes

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

echo "Configuring python virtual enviroment for Ansible"
echo 

mkdir $HOME/.venv
python3 -m venv $HOME/.venv
source $HOME/.venv/bin/activate

python3 -m pip install --upgrade pip
python3 -m pip install --upgrade virtualenv

python3 -m pip install -r ./requirements.txt

echo "Cloning my network automation repo into my desired path..."
echo ""

# clone ansible repo to ansible directory
if [ -d "etc/ansible" ]; then
    sudo rm -rf /etc/ansible
fi

git clone https://github.com/cjmvincent/Network-Automation.git $HOME/ansible
sudo ln -s $HOME/ansible /etc/ansible

sudo rm /etc/hosts
sudo cp $HOME/ansible/dns_hosts /etc/hosts

# install desired ansible collections
ansible-galaxy collection install cisco.ios
ansible-galaxy collection install paloaltonetworks.panos
ansible-galaxy collection install arubanetworks.aoscx
ansible-galaxy collection install arubanetworks.aos_switch
ansible-galaxy collection install ansible.windows
ansible-galaxy colleciton install community.windows
ansible-galaxy colleciton install community.vmware
ansible-galaxy collection install microsoft.ad
ansible-galaxy collection install checkmk.general

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
# Terminal                                                                    #
###############################################################################

echo "Configuring terminal..."
echo ""

chsh -s $(which zsh)

# install ohmyzsh
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install a couple of zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# change ohmyzsh theme to powerlevel10k
#sudo sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' $HOME/.zshrc


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


###############################################################################
# Dotbot                                                                      #
###############################################################################

git clone https://github.com/cjmvincent/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
./install