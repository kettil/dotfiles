#!/bin/bash

df_install() {

}

if [ ! -f /etc/debian_version ]; then
    exit
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
