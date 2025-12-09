#!/usr/bin/env bash

sudo apt install -y bash-completion

echo 'export PATH=$PATH:$HOME/bin' >>~/.bashrc
echo 'export LC_ALL=C.UTF-8' >>~/.bashrc
echo '. /etc/bash_completion' >>~/.bashrc
echo 'export EDITOR=nvim' >>~/.bashrc

cp '/setup/user/gitconfig' '/home/node/.gitconfig'

