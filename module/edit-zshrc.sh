#!/usr/bin/zsh

echo "------------ Beginning edit zshrc -------------"
# replace
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc
line_number=$(cat ~/.zshrc | grep -n 'plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' | cut -d ':' -f 1)
insert="$line_number"'i fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src'
sed -i "$insert" ~/.zshrc

# add
profile_script='
source ~/.profile'

fc_script='
# fc
FCEDIT=micro'

zoxide_script='
# zoxide
eval "$(zoxide init zsh)"'

bat_script="
# Bat
export MANPAGER=\"sh -c 'col -bx | bat -l man -p'\"
export MANROFFOPT=\"-c\"
export BAT_STYLE=\"numbers,rule,snip,header\""

fzf_script="
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS=\"--ansi\"
export FZF_DEFAULT_COMMAND=\"fd --color=always --exclude='/mnt/*' -H\""

echo $profile_script >>~/.zshrc
echo $fc_script >>~/.zshrc
echo $zoxide_script >>~/.zshrc
echo $bat_script >>~/.zshrc
echo $fzf_script >>~/.zshrc

echo "------------- Finished edit zshrc -------------"

# default .zshrc
# cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
