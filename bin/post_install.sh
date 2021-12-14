#!/bin/bash
####
# Post installation steps (after homebrew and links are setup)
####

echo "Post install steps"

echo " make zsh default shell"
chsh -s /bin/zsh

echo "...complete"

echo "Install starship"
brew install starship
echo "...complete"
