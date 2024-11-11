#!/usr/bin/zsh

# nala
echo "-- Beginning install Volian Linux Scar (Nala) -"
curl --retry 5 https://gitlab.com/volian/volian-archive/-/raw/main/install-nala.sh | zsh
## nala completion
/usr/bin/nala --show-completion zsh | sudo tee /usr/local/share/zsh/site-functions/_nala &>/dev/null
echo "-- Finished install Volian Linux Scar (Nala) --"
