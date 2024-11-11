#!/usr/bin/zsh

## dust
echo "-------------------- dust ---------------------"

name='dust'
repos='bootandy/dust'
arch_name='-x86_64-unknown-linux-musl'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
tar -x -C ~/temp --strip-components 1 -f ~/temp/$name-archive
git clone --depth 1 https://github.com/bootandy/dust ~/temp/$name-git
sudo chown root:root ~/temp/dust
sudo chown root:root ~/temp/$name-git/completions/_dust
sudo mv ~/temp/dust /usr/local/bin/
sudo mv ~/temp/$name-git/completions/_dust /usr/local/share/zsh/site-functions/
rm -f ~/temp/$name-archive
rm -rf ~/temp/*

echo "-------------------- dust ---------------------"