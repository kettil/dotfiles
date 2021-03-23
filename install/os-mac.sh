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

# Always show scrollbars
echo "- AppleShowScrollBars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# Expand save panel by default
echo "- NSNavPanelExpandedStateForSaveMode"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
echo "- PMPrintingExpandedStateForPrint"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Change default save location to local storage from iCloud for all Apps
echo "- NSDocumentSaveNewDocumentsToCloud"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
echo "- PrintingPrefs - Quit When Finished"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable “natural” (Lion-style) scrolling
echo "- swipescrolldirection"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

echo ""
echo "####################"
echo "# macos : copy fonts"
echo ""
mkdir -p ~/Library/Fonts
cp $DF_HOME/files/*.ttf ~/Library/Fonts
