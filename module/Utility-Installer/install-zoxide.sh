#!/usr/bin/zsh

## zoxide
echo "-------------------- zoxide -------------------"

name='zoxide'
repos='ajeetdsouza/zoxide'
arch_name='x86_64-unknown-linux-musl'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
tar -x -C ~/temp/ -f ~/temp/$name-archive
sudo chown root:root ~/temp/zoxide
sudo chown root:root ~/temp/completions/_zoxide
sudo chown root:root ~/temp/man/man1/*
sudo mv ~/temp/zoxide /usr/local/bin/
sudo mv ~/temp/completions/_zoxide /usr/local/share/zsh/site-functions/
sudo mv ~/temp/man/man1/* /usr/local/share/man/man1/
rm -f ~/temp/$name-archive
rm -rf ~/temp/*

echo "-------------------- zoxide -------------------"
