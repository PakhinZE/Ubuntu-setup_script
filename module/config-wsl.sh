#!/usr/bin/zsh

echo "------------ Beginning config wsl -------------"
sudo tee /etc/wsl.conf <<EOF
[automount]

[boot]
systemd = true
EOF
echo "------------ Finished config wsl --------------"