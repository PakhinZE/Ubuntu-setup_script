#!/usr/bin/zsh

echo "------------- Beginning install R -------------"
UBUNTU_NAME=$(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d '=' -f 2)
sudo curl -L https://rig.r-pkg.org/deb/rig.gpg -o /etc/apt/trusted.gpg.d/rig.gpg
sudo sh -c 'echo "deb http://rig.r-pkg.org/deb rig main" > /etc/apt/sources.list.d/rig.list'
sudo apt-get update -q=2
sudo apt-get install -y -q=2 r-rig
/usr/local/bin/rig add release
# R_LIB_LOCATION
old="R_LIBS_USER=\${R_LIBS_USER:-'%U'}"
new="R_LIBS_USER=\${R_LIBS_USER:-'~\/.local\/R\/%V\/%p'}"
script='s/'$old'/'$new'/g'
r_path=$(rig list --json | jq -r ".[0] | .path ")
sudo sed -i $script $r_path/lib/R/etc/Renviron
# R_REPOS
echo 'options(repos = c(PPM = "https://packagemanager.rstudio.com/cran/__linux__/'"$UBUNTU_NAME"'/latest", CRAN = "@CRAN@"))' |
    sudo tee -a $r_path/lib/R/etc/Rprofile.site
# Radian
/usr/local/bin/pipx install radian
# remove folder
sudo rm -rf ~/R
echo "------------- Finished install R --------------"
