#!/bin/bash

df_install() {
    echo "####################"
    echo "# macos : change settings"

    # change default save location to local storage from iCloud for all Apps
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
}

if [ "${OSTYPE:0:6}" != "darwin" ]; then
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
