#!/usr/bin/zsh

echo "----------- Beginning remove python -----------"

sudo apt-get purge -y -q=2 --autoremove python3-pip
sudo apt-get purge -y -q=2 --autoremove python3-venv
# pipx
sudo rm -f '/usr/local/bin/pipx'

echo "----------- Finished remvoe python ------------"
