#!/bin/bash

df_install() {
    echo "####################"
    echo "# dotfiles : create symlinks"

    find "$DF_HOME/configs" -type f |
        grep -vi '/README' |
        grep -vi '.md$' |
        while read line; do
            DF_FILE="${line/$DF_HOME\/configs\//}"
            echo "- ~/${DF_FILE}"
            mkdir -p "$(dirname ~/"${DF_FILE}")"
            ln -sf "$DF_HOME/configs/${DF_FILE}" ~/"${DF_FILE}"
        done
}

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'
    exit
fi


if [ "$(whoami)" != "$(stat -c %U "${DF_HOME}")" ]; then
    echo "####################"
    echo "# dotfiles : installation is skipped - wrong owner/user"
    echo ""
    return
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
