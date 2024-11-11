#!/usr/bin/zsh

## micro
echo "-------------------- micro --------------------"

name='micro'
repos='zyedidia/micro'
arch_name='-linux64-static'
url=$(curl --retry 5 -s https://api.github.com/repos/$repos/releases/latest | jq -r ".assets[] | select(.name | test(\"$arch_name\")) | .browser_download_url")
curl -sL --retry 5 --output ~/temp/$name-archive $url
tar -x -C ~/temp --strip-components 1 -f ~/temp/$name-archive
sudo chown root:root ~/temp/micro
sudo chown root:root ~/temp/micro.1
sudo mv ~/temp/micro /usr/local/bin/
sudo mv ~/temp/micro.1 /usr/local/share/man/man1/
rm -f ~/temp/$name-archive
rm -rf ~/temp/*
# micro config
rm -rf ~/.config/micro
mkdir -p ~/.config/micro
cat <<EOF >~/.config/micro/bindings.json
{
    "Alt-/": "lua:comment.comment",
    "Alt-CtrlDown": "SpawnMultiCursorDown",
    "Alt-CtrlUp": "SpawnMultiCursorUp",
    "Alt-e": "SelectToEnd",
    "Alt-s": "SelectToStart"
}
EOF

cat <<EOF >~/.config/micro/settings.json
{
    "colorscheme": "atom-dark"
}
EOF

# setup editor
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/micro 90

echo "-------------------- micro --------------------"
