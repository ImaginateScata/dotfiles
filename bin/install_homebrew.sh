#!/bin/bash
####
# Install homebrew if not already present
####

if command -v /opt/homebrew/bin/brew > /dev/null 2>&1; then
  echo "Homebrew already installed"
else
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "...complete"
  # Homebrew captures [Anonymous Aggregate User Behaviour Analytics](https://docs.brew.sh/Analytics) which you can opt-out
  /opt/homebrew/bin/brew analytics off
fi
