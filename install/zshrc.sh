#!/bin/bash

DF_FILE="zshrc"

df_install() {
    if [ "$(whoami)" != "$(ls -ld "${DF_HOME}" | awk '{print $3}')" ]; then
        echo "####################"
        echo "# zshrc : change config"
        cat "${DF_HOME}/templates/zshrc.sh"                     \
            | sed "s|^export DOTS=.*$|export DOTS=${DF_HOME}|"  \
            > "${DF_HOME}/zshrc.sh"
    else
        echo "####################"
        echo "# zshrc : change config is skipped - wrong owner/user"
    fi

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
