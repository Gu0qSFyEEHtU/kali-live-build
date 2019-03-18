#!/bin/bash

sudo apt update

mkdir deb
cd deb

wget http://http.kali.org/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.1_all.deb
wget https://archive.kali.org/kali/pool/main/l/live-build/live-build_20180925kali1_all.deb

sudo apt install -y live-build cdebootstrap debootstrap curl
sudo dpkg -i *.deb

cd /usr/share/debootstrap/scripts/
echo "default_mirror http://http.kali.org/kali"; sed -e "s/debian-archive-keyring.gpg/kali-archive-keyring.gpg/g" sid > /tmp/kali
sudo mv /tmp/kali .
sudo ln -s kali kali-rolling

cd ~/kali-live-build
sudo bash build.sh --verbose --variant moon
