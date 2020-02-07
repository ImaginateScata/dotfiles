#!/bin/bash

DOTFILES="${HOME}/Code/ImaginateScata/github.com/dotfiles"

echo "Setting links from '${DOTFILES}'"

rm "${HOME}/Brewfile" \
   "${HOME}/.zshrc" \
   "${HOME}/.saml2aws"

ln -s "${DOTFILES}/cfg/Brewfile" "${HOME}/Brewfile"
ln -s "${DOTFILES}/cfg/zshrc" "${HOME}/.zshrc"
ln -s "${DOTFILES}/cfg/saml2aws" "${HOME}/.saml2aws"

echo "..complete"
