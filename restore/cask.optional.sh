#!/usr/bin/env bash
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
echo "------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
xcode-select --install


if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

tap caskroom/cask
brew brew-cask
brew cask install slack
brew cask install tvshows
brew cask install sequential
brew cask install flux
#brew cask install calibre
brew cask install google-chrome
brew cask install firefox
#brew cask install jdownloader
#brew cask install libreoffice
brew cask install skype
brew cask install balsamiq-mockups
