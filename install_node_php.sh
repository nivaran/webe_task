#!/bin/bash

# installing NPM (Node Package Manager)
source ~/.bashrc # To make bash executable for below command
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash   # Clones the nvm repo and runs the install script in dir ~/.nvm

# Lets verify if nvm installed or not using - command -v nvm
if command -v nvm | grep -q "nvm";then
	echo "nvm Installed"
else 
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	command -v nvm
	echo "nvm installed"
	sleep 2
fi

# Lets Ask user for specific node version to install
nvm ls-remote
read -p "Type the specific node version to install with prefiv 'v' from above given version-list : " node_version
nvm install $node_version
#nvm alias default $node_version
pkill node # Restarting the node to accept the changes
echo ""
echo "The Installed Node Version is $(node --version)"
echo ""
echo "If want to  use this installed version - use command > nvm use $node_version"
echo ""
sleep 2
#------------------------------------------------------------------------------------------------------

# Installing PHP

echo "lets install php \n"
sleep 2
sudo apt-get update

# Adding repo of ondrej sury
sudo apt install software-properties-common ca-certificates lsb-release apt-transport-https 
sudo echo -e "\n" | apt-add-repository ppa:ondrej/php
sudo sleep 3
sudo apt-get update
read -p "enter the version of php , Try version 8.1, enter-  8.1 : " php_version
sudo apt install -y php$php_version 
echo "Install version is \n $(php -v) \n"

