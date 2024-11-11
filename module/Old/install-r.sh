#!/usr/bin/zsh

echo "------------- Beginning install R -------------"
R_VERSION='4.4.4'
UBUNTU_VERSION=$(cat /etc/lsb-release | \
                    grep DISTRIB_RELEASE= | \
                    cut -d '=' -f 2 | \
                    cut -d '.' -f 1-2 | \
                    sed 's/\.//g')
UBUNTU_NAME=$(cat /etc/lsb-release | grep DISTRIB_CODENAME | cut -d '=' -f 2)
link="https://cdn.posit.co/r/ubuntu-${UBUNTU_VERSION}/pkgs/r-${R_VERSION}_1_amd64.deb"
curl --retry 5 -O $link
sudo apt-get install -y ./r-${R_VERSION}_1_amd64.deb
sudo ln -s /opt/R/${R_VERSION}/bin/R /usr/local/bin/R 
sudo ln -s /opt/R/${R_VERSION}/bin/Rscript /usr/local/bin/Rscript
# R_LIB_LOCATION
old="R_LIBS_USER=\${R_LIBS_USER:-'%U'}"
new="R_LIBS_USER=\${R_LIBS_USER:-'~\/.local\/R\/%V\/%p'}"
script='s/'$old'/'$new'/g'
sudo sed -i $script /opt/R/${R_VERSION}/lib/R/etc/Renviron
# R_REPOS
echo 'options(repos = c(PPM = "https://packagemanager.rstudio.com/cran/__linux__/'"$UBUNTU_NAME"'/latest", CRAN = "@CRAN@"))' | \
    sudo tee -a /opt/R/${R_VERSION}/lib/R/etc/Rprofile.site
# Radian
/usr/local/bin/pipx install radian
# remove folder
sudo rm -rf ~/R
echo "------------- Finished install R --------------"