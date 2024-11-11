#!/usr/bin/zsh

echo "--------- Beginning apt add repository --------"
# remove old
sudo apt-add-repository -y -c main -c restricted -c universe -c multiverse -r http://archive.ubuntu.com/ubuntu
sudo apt-add-repository -y -c main -c restricted -r http://archive.ubuntu.com/ubuntu
sudo apt-add-repository -y -p updates -c main -c restricted -c universe -c multiverse -r http://archive.ubuntu.com/ubuntu
sudo apt-add-repository -y -p updates -c main -c restricted -r http://archive.ubuntu.com/ubuntu
sudo apt-add-repository -y -p security -c main -c restricted -c universe -c multiverse -r http://security.ubuntu.com/ubuntu/
sudo apt-add-repository -y -p security -c main -c restricted -r http://security.ubuntu.com/ubuntu/
sudo apt-add-repository -y -p backports -c main -c restricted -c universe -c multiverse -r http://archive.ubuntu.com/ubuntu
# add new
sudo apt-add-repository -y -c main -c restricted -c universe -c multiverse https://mirror.kku.ac.th/ubuntu/
sudo apt-add-repository -y -p updates -c main -c restricted -c universe -c multiverse https://mirror.kku.ac.th/ubuntu/
sudo apt-add-repository -y -p backports -c main -c restricted -c universe -c multiverse https://mirror.kku.ac.th/ubuntu/
sudo apt-add-repository -y -p security -c main -c restricted -c universe -c multiverse https://mirror.kku.ac.th/ubuntu/

echo "--------- Finished apt add repository ---------"
