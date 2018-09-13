#!/bin/bash

DF_FILE="zshrc"

df_install() {
    echo "####################"
    echo "# zshrc : change config"
    cat "${DF_HOME}/templates/zshrc.sh"                     \
        | sed "s|^export DOTS=.*$|export DOTS=${DF_HOME}|"  \
        > "${DF_HOME}/zshrc.sh"

    echo ""
    echo "####################"
    echo "# zshrc : create symlink"
    ln -fs "${DF_HOME}/zshrc.sh" ~/.zshrc
}

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'
    exit
fi

case "$1" in
    install)
      df_install
      ;;
    update)
      df_install
      ;;
    *)
      echo "Usage: $0 {install|update}"
esac
echo ""
