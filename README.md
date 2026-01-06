# Network Automation
This repository is a compilation of playbooks, scripts, Docker Compose files, and other tooling that I have amassed while studying for the **CCNP ENAUTO** exam. Many of these items have already been put into my personal production enviorment as part of my work as a first-year network engineer.

⚠️ **Important:**
This repository contains automation that can modify system configuration and install services. Always review scripts and playbooks before executing them in your environment.


## Setup
This is a setup I have primarily been running inside of an Ubuntu Docker container, but it should also work on bare metal or a virtual machine.

To get started run the following in your terminal of choice:


### 1) Download the ZIP (assuming you do not already have git installed already)
`curl -L -o Network-Automation.zip https://github.com/cjmvincent/Network-Automation/archive/refs/heads/main.zip`

### 2) Unzip it (creates Network-Automation-main/)
`unzip Network-Automation.zip`

### 3) Go to the repo folder
`cd Network-Automation-main`

### 4) Run the installer
`bash -x -e ./install.sh`


Setup includes:
* Installing Ansible, and cloning my repo into it's directory
* Installing a few of my personally desired Ansible collections
* Installing tools such Python, Git, Netmiko, Paramiko, Napalm, Net-Tools
* Installing Check_MK so I can monitor network devices
* Installing an instance of Rundeck as a GUI to compliment my Ansible Enviroment
* Installing a TFTP server for hosting firmware and images for my nodes