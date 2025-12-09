#!/usr/bin/env bash

set -eu -o pipefail

sudo mkdir -p /root/.ssh/
cat /setup/user/key.pub | sudo tee -a /root/.ssh/authorized_keys

mkdir -p /home/$USER/.ssh/
cat /setup/user/key.pub >> /home/$USER/.ssh/authorized_keys

sudo apt-get update
sudo apt install -y openssh-server

echo done
