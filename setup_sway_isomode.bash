#!/usr/bin/env bash
username="$1"
git clone https://github.com/JayGray/eos-sway

cd eos-sway

cp -R .dotfiles /home/$username/
chown -R $username:$username /home/$username/.dotfiles

# create config directory
mkdir /home/$username/.config
# change ownership of the config directory
chown -R $username:$username /home/$username/.config

# link all the dotfiles to config
ln -s /home/$username/.dotfiles/environment.d /home/$username/.config
ln -s /home/$username/.dotfiles/gtk-3.0 /home/$username/.config
ln -s /home/$username/.dotfiles/mako /home/$username/.config
ln -s /home/$username/.dotfiles/sway /home/$username/.config
ln -s /home/$username/.dotfiles/swaylock /home/$username/.config
ln -s /home/$username/.dotfiles/Thunar /home/$username/.config
ln -s /home/$username/.dotfiles/waybar /home/$username/.config
ln -s /home/$username/.dotfiles/wofi /home/$username/.config
ln -s /home/$username/.dotfiles/zsh /home/$username/.config
ln -s /home/$username/.dotfiles/kitty /home/$username/.config
ln -s /home/$username/.dotfiles/nvim /home/$username/.config
ln -s /home/$username/.dotfiles/chrome-flags.conf /home/$username/.config

# change ownership of the config directory again for content
chown -R $username:$username /home/$username/.config

# link .zshrc and .zprofile
ln -s /home/$username/.dotfiles/.zshrc /home/$username
ln -s /home/$username/.dotfiles/.zprofile /home/$username

# make scripts executable
chmod -R +x /home/$username/.dotfiles/sway/scripts
chmod -R +x /home/$username/.dotfiles/waybar/scripts
chmod +x /home/$username/.dotfiles/wofi/windows.py

# change ownership of the .zshrc and .zprofile
chown -h $username:$username /home/$username/.zshrc
chown -h $username:$username /home/$username/.zprofile

# install packages
pacman -S --needed --noconfirm - <packages-repository.txt

# prepare after-install script
cp -R after-install /home/$username
chown -R $username:$username /home/$username/after-install
chmod +x /home/$username/after-install/after-install.bash

cd ..

# remove git repo
rm -rf eos-sway

# set default shell
chsh -s /usr/bin/zsh $username

# enable services
systemctl enable ly
systemctl enable sshd
