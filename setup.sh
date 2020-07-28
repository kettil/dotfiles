#!/bin/bash

cd $(dirname "${0}")

DF_HOME="$(pwd)"
DF_GITS="${DF_HOME}/gits"

git pull

mkdir -p "${DF_GITS}"

cd "${DF_HOME}"
source ./install/template.sh
echo ""
cd "${DF_HOME}"
source ./install/dotfiles.sh
echo ""
cd "${DF_HOME}"
source ./install/os-mac.sh
echo ""
cd "${DF_HOME}"
source ./install/os-debian.sh
echo ""
cd "${DF_HOME}"
source ./install/brew.sh
echo ""
cd "${DF_HOME}"
source ./install/docker.sh
echo ""
cd "${DF_HOME}"
source ./install/kubernetes.sh
echo ""
cd "${DF_HOME}"
source ./install/zshrc.sh
echo ""
cd "${DF_HOME}"
source ./install/oh-my-zsh.sh
echo ""
cd "${DF_HOME}"
source ./install/oh-my-zsh-theme-powerlevel9k.sh
echo ""
cd "${DF_HOME}"
source ./install/oh-my-zsh-plugin.sh "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
echo ""
cd "${DF_HOME}"
source ./install/oh-my-zsh-plugin.sh "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"
echo ""

echo "####################"
echo "#"
echo "# you must call following command if you want to use the zsh shell"
echo "# chsh -s $(grep /zsh$ /etc/shells | tail -1)"
echo "#"
