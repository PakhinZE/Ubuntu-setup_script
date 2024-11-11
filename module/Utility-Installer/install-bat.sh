#!/usr/bin/zsh

## bat
echo "--------------------- bat ---------------------"

name='bat'
repos='sharkdp/bat'
arch_name='x86_64-unknown-linux-musl'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
tar -x -C ~/temp --strip-components 1 -f ~/temp/$name-archive
sudo chown root:root ~/temp/bat
sudo chown root:root ~/temp/autocomplete/bat.zsh
sudo chown root:root ~/temp/bat.1
sudo mv ~/temp/bat /usr/local/bin/
sudo mv ~/temp/autocomplete/bat.zsh /usr/local/share/zsh/site-functions/_bat
sudo mv ~/temp/bat.1 /usr/local/share/man/man1/
rm -f ~/temp/$name-archive
rm -rf ~/temp/*

echo "--------------------- bat ---------------------"