#!/usr/bin/zsh

echo "-------- Beginning remove repository ---------"

## Volian Linux Scar (Nala)
sudo rm -rf /etc/apt/sources.list.d/volian-archive-nala-unstable.sources
sudo rm -rf /usr/share/keyrings/volian-archive-scar-unstable.gpg

echo "-------- Finished remove repository ----------"
