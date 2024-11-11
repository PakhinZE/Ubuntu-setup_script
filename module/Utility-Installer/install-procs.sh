#!/usr/bin/zsh

## procs
echo "-------------------- procs --------------------"

name='procs'
repos='dalance/procs'
arch_name='x86_64-linux'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
unzip ~/temp/$name-archive -d ~/temp/
sudo chown root:root ~/temp/procs
sudo mv ~/temp/procs /usr/local/bin/
rm -f ~/temp/$name-archive
rm -rf ~/temp/*
### procs completion
procs --gen-completion-out zsh | sudo tee /usr/local/share/zsh/site-functions/_procs &>/dev/null

echo "-------------------- procs --------------------"