#!/bin/bash

df_install() {
    echo "####################"
    echo "# brew : update"
    brew update

    echo ""
    echo "####################"
    echo "# brew : install htop"
    brew install htop

    echo ""
    echo "####################"
    echo "# brew : install iftop"
    brew install iftop

    echo ""
    echo "####################"
    echo "# brew : install unrar"
    brew install unrar

    echo ""
    echo "####################"
    echo "# brew : install tree"
    brew install tree

}

df_update() {
    echo "####################"
    echo "# brew : update"
    brew update
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
