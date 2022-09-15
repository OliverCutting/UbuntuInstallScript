# Fix stupid popping sound
sudo sed -i 's/load-module module-suspend-on-idle/#load-module module-suspend-on-idle/' /etc/pulse/default.pa
systemctl restart --user pulseaudio

# Install Git
sudo apt update
sudo apt install git

# Install Vim
sudo apt install vim

# Install VSCode
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# Install Curl
sudo apt install curl 

# Install Gnome Tweak Tool
sudo apt install gnome-tweaks

# Set wallpaper
wget https://unsplash.com/photos/9wg5jCEPBsw/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjYzMTc4Nzc1&force=true&w=2400
mv download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjYzMTc4Nzc1 ~/Pictures/mountains.jpg
rm wget-log.1
gsettings set org.gnome.desktop.background picture-uri-dark file:///home/oliver/Pictures/mountains.jpg
gsettings set org.gnome.desktop.background picture-options stretched

# Install theme
mkdir Projects
cd Projects
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh
cd ~

# Disable auto screen lock
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Set terminal theme
wget https://raw.githubusercontent.com/daltonmenezes/aura-theme/main/packages/gnome-terminal/aura-theme.dconf
dconf load /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/ < ~/aura-theme.dconf
rm ~/aura-theme.dconf

# Install Docker & Docker Desktop
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install docker-ce docker-ce-cli containerd.io uidmap
sudo usermod -aG docker $USER
newgrp docker
wget https://desktop.docker.com/linux/main/amd64/docker-desktop-4.12.0-amd64.deb
sudo apt install ./docker-desktop-*-amd64.deb
rm docker-desktop-*-amd64.deb

# Install Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install awscli
sudo apt  install awscli

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

# Install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
