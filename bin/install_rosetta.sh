#!/bin/bash
####
# Install Rosetta 2 if not present for Apple Silicon
####

if [[ "$( uname -m )" == "arm64" ]]; then
  if pkgutil --files com.apple.pkg.RosettaUpdateAuto > /dev/null 2>&1; then
    echo "Rosetta 2 already installed"
  else
    echo "Installing Rosetta 2"
    softwareupdate --install-rosetta --agree-to-license
  fi
else
  echo "Not running Apple silicon so no need to install Rosetta 2"
fi
