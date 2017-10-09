#!/bin/bash

DF_FILE="zshrc"

df_install() {
    echo "####################"
    echo "# zshrc : change config "
    cat "${DF_HOME}/templates/zshrc.sh"                     \
        | sed "s|^export DOTS=.*$|export DOTS=${DF_HOME}|"  \
        > "${DF_HOME}/zshrc.sh"
}

if [ "${DF_HOME}" == "" ] || [ "${DF_GITS}" == "" ]; then
    echo '$DF_HOME or $DF_GITS is not defined'
    exit
fi

case "$1" in
  install)
    df_install
    ;;
  update)
    ;;
  *)
    echo "Usage: $0 {install|update}"
esac
echo ""
