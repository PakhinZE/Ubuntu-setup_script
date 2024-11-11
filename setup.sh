#!/usr/bin/dash

#check if this user have sudo access
if [ -z "$(groups $USER | grep sudo)" ]; then
    echo "This user does not have sudo access"
    exit 2
fi

sudo apt-get update -y -q=2
sudo apt-get full-upgrade -y -q=2

"./module/config-sudo.sh"
"./module/install-zsh.sh"
"./module/apt-add-repository.sh"
"./module/install-utility.sh"
"./module/edit-zshrc.sh"
"./module/config-wsl.sh"
"./module/install-python.sh"
"./module/install-r-rig.sh"
"./module/install-volian-scar.sh"
