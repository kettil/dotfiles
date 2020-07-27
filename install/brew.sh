#!/bin/bash

# ###################
# #### condition ####
# ###################

if [ "${OSTYPE:0:6}" != "darwin" ]; then
    return
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

# ###################
# ##### helper ######
# ###################

df_brew_core() {
    for arg in $@; do
        echo "- $arg"
        brew list $arg > /dev/null 2> /dev/null || brew install $arg
    done
}

df_brew_cask() {
    for arg in $@; do
        echo "- $arg (cask)"
        brew cask list $arg > /dev/null 2> /dev/null || brew cask install $arg
    done
}

# ###################
# ## install setup ##
# ###################

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

df_brew_core zsh
# fuse
df_brew_cask osxfuse
df_brew_core sshfs
# networking
df_brew_core nmap fping speedtest-cli
df_brew_cask postman
# monitoring
df_brew_core htop iftop
# system tools
df_brew_core nano git tree wget unrar p7zip gnupg jq fzf fd bat
# development
df_brew_core node helm
df_brew_cask docker
# videos
df_brew_core ffmpeg mkvtoolnix mp4v2 youtube-dl atomicparsley
# pdf
df_brew_core gs qpdf
# check sd cards
df_brew_core f3
