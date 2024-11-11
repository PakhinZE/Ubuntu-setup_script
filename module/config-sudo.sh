#!/usr/bin/dash

echo "------------ Beginning config sudo ------------"

sudo touch /etc/sudoers.d/sudoers &&
    echo $USER' ALL=(ALL:ALL) NOPASSWD: FOLLOW: ALL' | sudo tee /etc/sudoers.d/sudoers

echo "------------ Finished config sudo -------------"
