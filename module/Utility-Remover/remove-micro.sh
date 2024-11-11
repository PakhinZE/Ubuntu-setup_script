#!/usr/bin/zsh

## micro
echo "-------------------- micro --------------------"

sudo rm -f /usr/local/bin/micro
sudo rm -f /usr/local/share/man/man1/micro.1
sudo rm -rf /home/pakhinze/.config/micro/

# setup editor
sudo update-alternatives --remove editor /usr/local/bin/micro

echo "remove micro"

echo "-------------------- micro --------------------"