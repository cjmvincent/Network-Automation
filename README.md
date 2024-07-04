# Network Automation
Here is a complilation of playbooks, scripts, docker compose files, etc that I have amassed as I have been studying for the CCNP ENAUTO. These are also things I have begun putting into production as first year Network Engineer.


## Setup
Note: this is a setup I have running on an Ubuntu box primarily, but also cloned onto my Macbook. 

To get going with the files on an Ubuntu machine run the following command in your terminal of choice:

` bash -c "$(wget -qO - https://raw.githubusercontent.com/cjmvincent/Network-Automation/main/install.sh)" `

Setup includes:
* Installing Ansible, and cloning my repo into it's directory
* Installing a few of my personally desired Ansible collections
* Installing tools such Python, Git, Netmiko, Paramiko, Napalm, Net-Tools
* Installing Check_MK so I can monitor network devices
