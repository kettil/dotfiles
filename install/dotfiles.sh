#!/bin/bash

df_install() {
    echo "####################"
    echo "# dotfiles : create symlinks"

    find "$DOTS/configs" -type f |
        grep -vi '/README' |
        grep -vi '.md$' |
        while read line; do
            DF_FILE="${line/$DOTS\/configs\//}"
            echo "- ~/${DF_FILE}"
            ln -sf "$DOTS/configs/${DF_FILE}" ~/"${DF_FILE}"
        done
}

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
