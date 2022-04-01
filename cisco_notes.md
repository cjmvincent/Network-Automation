Cisco Basic Setup
Minimum requirements to begin communicating with Ansible

en
conf t
hostname R1
ip domain-name cisco.com
username charles priv 15 secret cisco123

crypto key gen rsa mod 1024
ip ssh ver 2

line vty 0 15
login local
transport input ssh

end
