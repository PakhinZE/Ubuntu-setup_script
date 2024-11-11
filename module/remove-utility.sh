#!/usr/bin/zsh

echo "---------- Beginning remove utility ----------"
# remove utility

"./module/Utility-Remover/remove-bat.sh"
"./module/Utility-Remover/remove-dust.sh"
"./module/Utility-Remover/remove-eza.sh"
"./module/Utility-Remover/remove-fd.sh"
"./module/Utility-Remover/remove-fzf.sh"
"./module/Utility-Remover/remove-micro.sh"
"./module/Utility-Remover/remove-procs.sh"
"./module/Utility-Remover/remove-zoxide.sh"

## man
sudo rm -rf /usr/local/share/man/man1/

echo "---------- Finished remove utility -----------"
