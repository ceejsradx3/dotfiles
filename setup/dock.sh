#!/bin/sh bash

#remove pre-existing apps from dock
dockutil --no-restart --remove all

#rebuild apps in dock
dockutil --no-restart --add "/System/Applications/Mission Control.app"
dockutil --no-restart --add "/Applications/Mirosoft Remote Desktop.app"
dockutil --no-restart --add "/System/Applications/Shortcuts.app"
dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/GitHub Desktop.app"
dockutil --no-restart --add "/Applications/Cyberduck.app"
dockutil --no-restart --add "/System/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Discord.app"
dockutil --no-restart --add "/Applications/YACReaderLibrary.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Reminders.app"
dockutil --no-restart --add "/System/Applications/Notes.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Music.app"
dockutil --no-restart --add "~/Downloads"

killall Dock
