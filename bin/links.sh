#!/bin/bash

DOTFILES="${HOME}/Code/ImaginateScata/github.com/dotfiles"

echo "Setting links from '${DOTFILES}'"

echo "..removing old files"
rm -f "${HOME}/Brewfile" \
      "${HOME}/.zshrc" \
      "${HOME}/.saml2aws" \
      "${HOME}/.ssh/config" \
      "${HOME}/.aws/config"

echo "..creating new diretories"
mkdir -p "${HOME}/.ssh/"
mkdir -p "${HOME}/.aws/"

echo "..linking files"
ln -s "${DOTFILES}/cfg/Brewfile" "${HOME}/Brewfile"
ln -s "${DOTFILES}/cfg/zshrc" "${HOME}/.zshrc"
ln -s "${DOTFILES}/cfg/saml2aws" "${HOME}/.saml2aws"
ln -s "${DOTFILES}/cfg/ssh_config" "${HOME}/.ssh/config"
ln -s "${DOTFILES}/cfg/aws_config" "${HOME}/.aws/config"

echo "..change file permissions"
chmod 0400 "${DOTFILES}/cfg/ssh_config"
chmod 0400 "${HOME}/.ssh/anthony"*

echo "complete"
