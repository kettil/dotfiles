#!/bin/bash

DF_NAME="zsh-syntax-highlighting"
DF_FULLNAME="oh-my-zsh-plugin-${DF_NAME}"
DF_TARGET="${DF_GITS}/oh-my-zsh/plugins"

df_install() {
    echo "####################"
    echo "# oh-my-zsh : plugin : install (${DF_NAME})"
    if [ -d "${DF_GITS}/${DF_FULLNAME}" ]; then
        cd "${DF_GITS}/${DF_FULLNAME}"
        git pull --rebase --stat origin master
    else
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${DF_GITS}/${DF_FULLNAME}"
    fi

    echo ""
    echo "####################"
    echo "# oh-my-zsh : plugin : create link (${DF_NAME})"
    mkdir -p "${DF_TARGET}"
    ln -sf "${DF_GITS}/${DF_FULLNAME}" "${DF_TARGET}/${DF_NAME}"
}

df_update() {
    echo "####################"
    echo "# oh-my-zsh : plugin : update ${DF_NAME}"
    cd "${DF_GITS}/${DF_FULLNAME}"
    git pull --rebase --stat origin master
}

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
