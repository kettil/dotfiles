#!/bin/bash

cd $(dirname "${0}")

DF_HOME="$(pwd)"
DF_GITS="${DF_HOME}/gits"

git pull

mkdir -p "${DF_GITS}"

df_install() {
  cd "${DF_HOME}"
  source ./install/$1.sh "$2" "$3"
  echo ""
}

df_install "macos"
df_install "brew"
df_install "dotfiles"
df_install "template"
df_install "docker"
df_install "kubernetes"
df_install "zshrc"
df_install "oh-my-zsh"
df_install "oh-my-zsh-theme-powerlevel10k"
df_install "oh-my-zsh-plugin" "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
df_install "oh-my-zsh-plugin" "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"

echo "####################"
echo "#"
echo "# you must call following command if you want to use the zsh shell"
echo "# chsh -s $(grep /zsh$ /etc/shells | tail -1)"
echo "#"
