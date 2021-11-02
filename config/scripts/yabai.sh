#!/usr/bin/env bash

# https://github.com/koekeishiya/yabai
# MacOS window manager
brew install koekeishiya/formulae/yabai
# Password require
#sudo yabai --install-sa
#sudo yabai --load-sa

# https://github.com/stedolan/jq
# Lightweight and flexible command-line JSON processor 
brew install jq

# https://github.com/koekeishiya/skhd
# Simple hotkey daemon for macOS
brew install koekeishiya/formulae/skhd

brew services start yabai
