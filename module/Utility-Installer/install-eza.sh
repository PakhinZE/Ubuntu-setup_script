#!/usr/bin/zsh

## eza
echo "--------------------- eza ---------------------"

name='eza'
repos='eza-community/eza'

arch_name='unknown-linux-musl.tar.gz'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
tar -x -C ~/temp --strip-components 1 -f ~/temp/$name-archive

completion_name='completion'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$completion_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
tar -x -C ~/temp --strip-components 1 -f ~/temp/$name-archive

man_name='man'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$man_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
tar -x -C ~/temp --strip-components 1 -f ~/temp/$name-archive

sudo chown root:root ~/temp/eza
sudo chown root:root ~/temp/target/completions-*/_eza
sudo chown root:root ~/temp/target/man-*/*
sudo mv ~/temp/eza /usr/local/bin/
sudo mv ~/temp/target/completions-*/_eza /usr/local/share/zsh/site-functions/
sudo mv ~/temp/target/man-*/* /usr/local/share/man/man1/
rm -f ~/temp/$name-archive
rm -rf ~/temp/*

echo "--------------------- eza ---------------------"
