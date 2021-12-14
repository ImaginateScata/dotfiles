#!/bin/bash
####
# Install AWS SSO required tooling
####

python3 -m pip install --user pipx
python3 -m pipx ensurepath
"${HOME}/Library/Python/3.9/bin/pipx" install aws-sso-util
