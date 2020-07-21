#!/bin/bash
####
# Install homebrew if not already present
####

if command -v brew &> /dev/null; then
  echo "Homebrew already installed"
else
  echo "Installing homebrew"
  echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "...complete"
fi
