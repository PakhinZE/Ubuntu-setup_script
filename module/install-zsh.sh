#!/usr/bin/dash

echo "------------ Beginning install zsh ------------"
sudo apt-get update -q=2
sudo apt-get upgrade -q=2 -y
sudo apt-get install -q=2 -y zsh
# oh my zsh
mkdir -p ~/temp
curl -fsSL --retry 5 https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh --output ~/temp/install.sh
sh ~/temp/install.sh --unattended
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
rm -rf ~/temp
# change default shell
sudo chsh -s /usr/bin/zsh $USER
echo "------------ Finished install zsh -------------"
