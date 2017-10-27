#!/bin/bash

df_install() {
    echo "####################"
    echo "# macos : change settings"
    echo ""

    # change default save location to local storage from iCloud for all Apps
    echo " - NSDocumentSaveNewDocumentsToCloud"
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
