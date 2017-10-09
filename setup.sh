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
