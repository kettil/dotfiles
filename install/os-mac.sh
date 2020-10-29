#!/bin/bash

# ###################
# #### condition ####
# ###################

if [ "${OSTYPE:0:6}" != "darwin" ]; then
    return
fi

if [ "${DF_HOME}" == "" ]; then
    echo '$DF_HOME is not defined'

    exit 1
fi

# ###################
# ## install setup ##
# ###################

echo "####################"
echo "# macos : change settings"
echo ""

# change default save location to local storage from iCloud for all Apps
echo "- NSDocumentSaveNewDocumentsToCloud"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "####################"
echo "# macos : copy fonts"
echo ""
mkdir -p ~/Library/Fonts
cp $DF_HOME/files/*.ttf ~/Library/Fonts
