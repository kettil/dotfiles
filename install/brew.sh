#!/bin/bash

df_install() {
    echo "####################"
    echo "# brew : update"
    brew update

    echo ""
    echo "####################"
    echo "# brew : install"

    df_install_brew zsh
    df_install_brew htop
    df_install_brew iftop
    df_install_brew unrar
    df_install_brew tree
    df_install_brew node
}

df_install_brew() {
    echo ""
    echo "- $1"
    brew install "$1"
}

df_update() {
    echo "####################"
    echo "# brew : update"
    brew update

    echo "####################"
    echo "# brew : upgrade"
    brew upgrade
}

if [ "${OSTYPE:0:6}" != "darwin" ]; then
    exit
fi

if [ ! -e /usr/local/bin/brew ]; then
    echo "####################"
    echo "# brew is not installed"
    echo "#"
    echo "# you must install homebrew (mac only)"
    echo "# -> https://brew.sh"
    echo "#"
    echo ""

    exit
fi

case "$1" in
    install)
        df_install
        ;;
    update)
        df_update
        ;;
    *)
        echo "Usage: $0 {install|update}"
esac
echo ""
