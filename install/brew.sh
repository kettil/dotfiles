#!/bin/bash

df_install() {
    echo "####################"
    echo "# brew : update"
    brew update

    echo ""
    echo "####################"
    echo "# brew : upgrade"
    brew upgrade

    echo ""
    echo "####################"
    echo "# brew : install"

    df_install_brew zsh
    # fuse
    df_install_cask osxfuse
    df_install_brew sshfs
    # networking
    df_install_brew nmap fping speedtest-cli
    # monitoring
    df_install_brew htop iftop
    # system tools
    df_install_brew nano git tree wget unrar p7zip
    # runtimes
    df_install_brew node
    # videos
    df_install_brew ffmpeg mkvtoolnix mp4v2 youtube-dl atomicparsley
    # pdf
    df_install_brew gs qpdf
    # check sd cards
    df_install_brew f3
}

df_install_brew() {
    echo ""
    echo "- $@"
    brew install "$@"
}

df_install_cask() {
    echo ""
    echo "- cask - $@"
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
