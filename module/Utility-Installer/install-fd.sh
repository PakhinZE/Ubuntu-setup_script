#!/usr/bin/zsh

## fd
echo "---------------------- fd ---------------------"

name='fd'
repos='sharkdp/fd'
arch_name='fd-musl_.+_amd64.deb'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name.deb $url
sudo apt-get install -q=2 -y ~/temp/$name.deb
rm -f ~/temp/$name.deb

echo "---------------------- fd ---------------------"
