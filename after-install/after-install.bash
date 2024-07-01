#!/usr/bin/env bash

# Install packages only available via yay
yay -S --needed --noconfirm - <yay-repository.txt

# Uninstall pre-installed packages via yay
yay -Rsn --noconfirm vi

# Install n and NodeJS LTS
curl -L https://bit.ly/n-install | bash -s -- -y

# delete after-install folder
cd ..
rm -rf after-install
