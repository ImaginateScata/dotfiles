#!/bin/bash
####
# Post installation steps (after homebrew and links are setup)
####

echo "Post install steps"

echo " make zsh default shell"
chsh -s /bin/zsh

echo "...complete"

echo "Install ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "...complete"
