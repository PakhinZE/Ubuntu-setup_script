#!/usr/bin/zsh

echo "---------- Beginning install utility ----------"

mkdir -p ~/temp
sudo mkdir -p /usr/local/share/man/man1/

"./module/Utility-Installer/install-jq.sh"
"./module/Utility-Installer/install-zip.sh"

"./module/Utility-Installer/install-bat.sh"
"./module/Utility-Installer/install-dust.sh"
"./module/Utility-Installer/install-eza.sh"
"./module/Utility-Installer/install-fd.sh"
"./module/Utility-Installer/install-fzf.sh"
"./module/Utility-Installer/install-micro.sh"
"./module/Utility-Installer/install-procs.sh"
"./module/Utility-Installer/install-zoxide.sh"

rm -rf ~/temp

echo "---------- Finished install utility -----------"
