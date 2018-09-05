#!/bin/bash
brew cleanup -s
rm -rf $(brew --cache)
