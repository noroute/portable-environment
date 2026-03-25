#!/bin/bash
# macOS system preferences

# 1. Function keys act as standard function keys (not media keys)
defaults write -g com.apple.keyboard.fnState -bool true

# 2. Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# 3. Finder: use list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# 4. Trackpad: tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# 5. Trackpad: two-finger tap as right click
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true

# 6. Dock: auto-hide and small size
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 36

# 7. Require password immediately after screensaver starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# 8. Hot corner: bottom-left activates screen saver
#    wvous-bl-corner = 5 (screen saver), wvous-bl-modifier = 0 (no modifier key)
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Restart affected apps
killall Finder 2>/dev/null
killall Dock 2>/dev/null
