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

    exit 1
fi

# ###################
# ##### helper ######
# ###################

df_brew_core() {
    echo "- ${1}"
    brew list ${1} > /dev/null 2> /dev/null || brew install ${1} ${2}
}

df_brew_cask() {
    echo "- ${1} (cask)"

    if [ -e /Applications/${1}.app ]; then
        brew list --cask ${1} > /dev/null 2> /dev/null || echo "  -> was installed manually"
    else
        brew list --cask ${1} > /dev/null 2> /dev/null || brew install --cask ${1} ${2}
    fi
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
echo "# brew : remove"

echo "- node"
brew list node > /dev/null 2> /dev/null && brew uninstall --ignore-dependencies node
brew list node > /dev/null 2> /dev/null && brew uninstall --force node

echo ""
echo "####################"
echo "# brew : install"

# shell

df_brew_core zsh

# system tools

# Install GNU core utilities (those that come with macOS are outdated).
df_brew_core coreutils
# Install some other useful utilities like `sponge`.
df_brew_core moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
df_brew_core findutils
# Install GNU `sed`, overwriting the built-in `sed`.
df_brew_core gnu-sed --with-default-names
df_brew_core nano
df_brew_core git
df_brew_core git-lfs
df_brew_core tree
# Install `wget` with IRI support.
brew install wget --with-iri
df_brew_core unrar
df_brew_core p7zip
# Install GnuPG to enable PGP-signing commits.
df_brew_core gnupg
df_brew_core jq
df_brew_core fzf
df_brew_core fd
df_brew_core bat
df_brew_core exa
df_brew_core grep
df_brew_core openssh
df_brew_core screen
df_brew_core gs
df_brew_core imagemagick --with-webp

# fuse

df_brew_cask osxfuse
df_brew_core sshfs

# networking

df_brew_core nmap
df_brew_core fping
df_brew_core speedtest-cli

# monitoring

df_brew_core htop
df_brew_core iftop

# development

df_brew_core helm
df_brew_core grex
df_brew_core nvm
df_brew_cask docker
df_brew_cask postman

# videos

df_brew_core ffmpeg
df_brew_core mkvtoolnix
df_brew_core mp4v2
df_brew_core youtube-dl
df_brew_core atomicparsley

# pdf

df_brew_core gs
df_brew_core qpdf

# check sd cards

df_brew_core f3

# applications

df_brew_cask hex-fiend

echo ""
echo "####################"
echo "# brew : cleanup"

brew cleanup

echo ""
echo "####################"
echo "# brew(nvm) : configure"

export NVM_DIR="$HOME/.nvm"
mkdir -p $NVM_DIR

if [ ! -e $HOME/.nvmrc ]; then
    echo "lts/*" > $HOME/.nvmrc
fi

source $(brew --prefix nvm)/nvm.sh
nvm cache clear

echo ""
echo "####################"
echo "# brew(nvm) : install latest"
nvm install node

echo ""
echo "####################"
echo "# brew(nvm) : install LTS"
nvm install --lts

echo ""
echo "####################"
echo "# brew(nvm) : LTS is the default version"
nvm alias default "lts/*"
