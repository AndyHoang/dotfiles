#!/usr/bin/env bash
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


echo "------------------------------"
echo "Installing Xcode Command Line Tools."
# Install Xcode command line tools
#xcode-select --install



echo "------------------------------"
echo "Updating OSX.  If this requires a restart, run the script again."
#sudo softwareupdate -ivr



if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew install rcmdnk/file/brew-file

brew file install


