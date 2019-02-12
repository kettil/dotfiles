#!/bin/bash

df_install() {
    if [ "$(id)" == "uid=0(root) gid=0(root) groups=0(root)" ]; then
        echo ""
        echo "####################"
        echo "# debian : update"
        sudo apt-get update

        echo ""
        echo "####################"
        echo "# debian : install"
        sudo apt-get install -y zsh
        # monitoring
        sudo apt-get install -y htop iftop
        # system tools
        sudo apt-get install -y nano git tree wget
    else
        echo ""
        echo "# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        echo "# !! You do not have root privileges !!"
        echo "# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    fi

    echo ""
    echo "####################"
    echo "# debian : copy fonts"
    echo ""
    mkdir -p ~/.local/share/fonts
    ln -sf ~/.local/share/fonts ~/.fonts
    cp $DF_HOME/files/*.ttf ~/.fonts
    chmod -R 644 ~/.fonts/*
}

if [ ! -f /etc/debian_version ]; then
    return
fi

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
