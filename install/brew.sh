#!/bin/bash

df_install() {
    echo "####################"
    echo "# brew : update"
    brew update

    echo ""
    echo "####################"
    echo "# brew : install"

    df_install_brew zsh
    df_install_cask osxfuse
    df_install_brew sshfs
    df_install_brew nmap fping
    df_install_brew htop iftop
    df_install_brew tree wget unrar
    df_install_brew node
    df_install_brew ffmpeg mkvtoolnix mp4v2
    df_install_brew youtube-dl atomicparsley
}

df_install_brew() {
    echo ""
    echo "- $1"
    brew install "$@"
}

df_install_cask() {
    echo ""
    echo "- cask - $1"
    brew cask install "$@"
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
