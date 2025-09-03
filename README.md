# Network Automation
Here is a complilation of playbooks, scripts, docker compose files, etc that I have amassed as I have been studying for the CCNP ENAUTO. These are also things I have begun putting into production as first year Network Engineer.


## Setup
Note: this is a setup I have running on an Ubuntu box primarily, but also cloned onto my Macbook. 

To get started with this repo on an Ubuntu machine run the following commands in your terminal of choice:


### 1) Download the ZIP
`curl -L -o Network-Automation.zip \
  https://github.com/cjmvincent/Network-Automation/archive/refs/heads/main.zip
  `

### 2) Unzip it (creates Network-Automation-main/)
`unzip Network-Automation.zip
`

### 3) Go to the repo folder
`cd Network-Automation-main
`

### 4) Run the installer
### (either make it executable or run with bash directly)
`chmod +x install.sh
./install.sh
`
### or: 
`bash install.sh
`


Setup includes:
* Installing Ansible, and cloning my repo into it's directory
* Installing a few of my personally desired Ansible collections
* Installing tools such Python, Git, Netmiko, Paramiko, Napalm, Net-Tools
* Installing Check_MK so I can monitor network devices
