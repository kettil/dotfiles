#!/bin/bash

cd $(dirname "${0}")

DF_HOME="$(pwd)"
DF_GITS="${DF_HOME}/gits"

df_run() {
    mkdir -p "${DF_GITS}"

    #source ./install/brew.sh "${1}"
    cd "${DF_HOME}"
    source ./install/zshrc.sh "${1}"
    cd "${DF_HOME}"
    source ./install/oh-my-zsh.sh "${1}"
    cd "${DF_HOME}"
    source ./install/oh-my-zsh-theme-powerlevel9k.sh "${1}"
    cd "${DF_HOME}"
    source ./install/oh-my-zsh-plugin.sh "${1}" "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions.git"
    cd "${DF_HOME}"
    source ./install/oh-my-zsh-plugin.sh "${1}" "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting.git"

    ln -fs ~/.dotfiles/zshrc.sh ~/.zshrc

    echo "####################"
    echo "#"
    echo "# you must call following command if you want to use the zsh shell"
    echo "# chsh -s $(grep /zsh$ /etc/shells | tail -1)"
    echo "#"
}

case "$1" in
  install)
    df_run "install"
    ;;
  update)
    df_run "update"
    ;;
  *)
    echo "Usage: $0 {install|update}"
esac
