#!/usr/bin/zsh

echo "----------- Beginning install python ----------"
mkdir -p ~/temp

sudo apt-get install -y -q=2 python3-pip
sudo apt-get install -y -q=2 python3-venv
# pipx
# sudo apt-get install -y pipx &> /dev/null
name='pipx'
repos='pypa/pipx'
arch_name='.pyz'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name $url
sudo chown root:root ~/temp/$name
sudo chmod 755 ~/temp/$name
sudo mv ~/temp/$name '/usr/local/bin/'

rm -rf ~/temp
echo "----------- Finished install python -----------"
