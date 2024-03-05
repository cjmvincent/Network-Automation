# to get started simply run:
# bash -c "$(wget -qO - https://raw.githubusercontent.com/cjmvincent/Network-Automation/main/install.sh)"

# just to make sure all packages and such are fresh
sudo apt update
sudo apt upgrade --yes

sudo apt install apt-transport-https ca-certificates curl software-properties-common

# add required repositories for the packages and utilities I want to install
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}

sudo add-apt-repository --yes universe
sudo add-apt-repository --yes ppa:ansible/ansible
sudo add-apt-repository --yes ppa:deadsnakes/ppa

sudo apt update
sudo apt upgrade --yes


# install libs, dependencies, and apps
sudo apt install build-essential net-tools software-properties-common \
<<<<<<< HEAD
    synaptic curl zsh git \
    docker.io ansible ipcalc --yes
=======
    synaptic curl zsh \
    git python3-pip \
    docker-ce docker-ce-cli docker-compose-plugin containerd.io docker-buildx-plugin \
    ansible ipcalc -y
<<<<<<< Updated upstream
=======
>>>>>>> 871ffc6e473fb00d90a743d374680846c497c2ba
>>>>>>> Stashed changes


sudo apt update
sudo apt upgrade --yes

#update pip
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

# install some network management tools
#pip install paramiko netmiko napalm pywinrm ansible ansible-pylibssh awxkit --user


# install vscode
sudo snap install code --classic
sudo snap install postman vlc


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


# install and create site (instance) of checkmk
#cd /tmp/
#wget https://download.checkmk.com/checkmk/1.6.0p27/check-mk-raw-1.6.0p27_0.focal_amd64.deb
#sudo apt install -y ./check-mk-raw-1.6.0p27_0.focal_amd64.deb
#sudo omd create your_site_name > ~/Desktop/checkmkcreds.txt
#sudo omd start your_site_name


# configure firewall
sudo ufw enable

sudo ufw allow ssh

# start docker
#sudo systemctl enable --now docker


# # install homebrew if using mac
# if test ! $(which brew); then
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#   echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
#   eval "$(/opt/homebrew/bin/brew shellenv)"
# fi

# brew update


# # install ohmyzsh
# if test ! $(which omz); then
#   /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
# fi

# # Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
# rm -rf $HOME/.zshrc
# ln -s .zshrc $HOME/.zshrc%          