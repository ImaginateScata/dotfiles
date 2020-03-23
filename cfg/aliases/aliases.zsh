# SYSTEM UPDATES

## BREW
alias brewup='brew update ; brew upgrade ; brew cleanup ; brew doctor'

## MAC UPDATE
alias updatesystem='sudo softwareupdate --install --verbose --recommended'

## ANTIGEN
alias antigen_update='antigen reset ; antigen update'

## OH MY ZSH
alias oh_my_zsh_update='upgrade_oh_my_zsh'

## DAILY UPDATE
alias daily='oh_my_zsh_update ; antigen_update ; brewup ; pushd $HOME > /dev/null 2>&1 ; brew bundle install ; popd > /dev/null 2>&1 ; updatesystem'

# TIME UPDATE
# shellcheck disable=SC2142
alias timesync='sudo ntpdate -u $(sudo systemsetup -getnetworktimeserver| awk "{print $4}")'

# WIFI
alias wifi_restart='networksetup -setairportpower en0 off; networksetup -setairportpower en0 on'

# SPEEDTEST
alias fast='curl -fsSL https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 - --exclude 9660'
alias fast_me='curl -fsSL https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | SSL_CERT_FILE=~/.certs/zscalar.pem python3 - --server 2225 --exclude 9660'

# SECURITY / KEYCHAIN
password_store() { if [ "${#}" -eq 2 ]; then security add-generic-password -a "${USER}" -s "${1}" -w "${2}" -T "$(which security)" ; else echo "Pass two param; the key and the password" ; fi ; }
password_update() { if [ "${#}" -eq 2 ]; then security add-generic-password -a "${USER}" -s "${1}" -w "${2}" -T "$(which security)" -U ; else echo "Pass two param; the key and the password" ; fi ; }
password_retrieve() { if [ "${#}" -eq 1 ]; then security find-generic-password -a "${USER}" -s "${1}" -w -D "application password" ; else echo "Pass one param; the key of the password" ; fi ; }
password_delete() { if [ "${#}" -eq 1 ]; then security delete-generic-password -a "${USER}" -s "${1}" ; else echo "Pass one param; the key to be deleted" ; fi ; }

# DEFAULT CODE EDITOR FOR KUBE
export KUBE_EDITOR='code --wait'

# DO NOT PAGE WITH AWSCLI
export AWS_PAGER=""

# KUBE ALIASES
alias kubectx=kctx
alias kubens=kns
