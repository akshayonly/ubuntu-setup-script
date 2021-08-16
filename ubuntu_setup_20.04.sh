#!/usr/bin/env bash

##########################################################
# Fresh Setup Script:
# This script downloads & installs packages which I use on 
# daily bases on newly installed Linux (Debian) distribution.
##########################################################

echo "----------INSTALLING PACKAGES & APPS----------"

# Adding repositories 
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-get-repository ppa:linrunner/tlp
sudo curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-get-release.s3.brave.com/
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-get-release.s3.brave.com/ stable main" | sudo tee /etc/apt-get/sources.list.d/brave-browser-release.list
echo "deb https://download.sublimetext.com/ apt-get/stable/" | sudo tee /etc/apt-get/sources.list.d/sublime-text.list
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt-get update

# Installing applications

# System
sudo apt-get install -f ubuntu-restricted-extras -y
sudo apt-get install -f libavcodec-extra -y
sudo apt-get install -f libdvd-pkg -y
sudo apt-get install -f gdebi -y
sudo apt-get install -f apt-transport-https curl -y
sudo apt-get install -f curl -y
sudo apt-get install openssh-server

# Utility
sudo apt-get install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip -y
sudo apt-get install git -y
sudo apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev make gettext libz-dev libssl-dev libghc-zlib-dev -y
sudo apt-get install -f lm-sensors -y
sudo sensors-detect
sudo apt-get install -f psensor -y
sudo apt-get install -f tlp tlp-rdw -y

# Daily
sudo apt-get install -f neofetch -y
sudo apt-get install -f telegram-desktop -y
sudo apt-get install -f sublime-text -y
sudo apt-get install -f vlc -y
sudo apt-get install -f spotify-client -y
sudo apt-get install -f brave-browser -y 
sudo apt-get install -f qbittorrent -y


# Themes & Icons
sudo apt-get install papirus-icon-theme
sudo apt-get install papirus-folders


echo "----------LAST STEP----------"

mkdir ~/.icons && mkdir ~/.themes

sudo apt-get --fix-broken install
sudo apt-get autoremove 
sudo apt-get autoclean 
sudo tlp start

echo "----------DONE! ENJOY NEW SETUP----------"
