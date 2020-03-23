# dotfiles

My dot files and OSX bootstrap scripts.

## Setting up github.com

Set up ssh key:

```bash
ssh-keygen -t rsa -b 4096 -C "anthony.scata@imaginatelabs.com" -f "${HOME}/.ssh/anthonyscata_imaginatelabs_github"
```

Copy public key into variable:

```bash
ssh_key=$(<~/.ssh/anthonyscata_imaginatelabs_github.pub)
```

Create a Personal access token from [github tokens](https://github.com/settings/tokens) with the `write:public_key`
permissions. Copy the key contents into the variable `github_access_token`.

Upload the public key into github:

```bash
curl -i -H"Authorization: token ${github_access_token}" --data @- https://api.github.com/user/keys << EOF
{
    "title" : "$(scutil --get LocalHostName) $(date)",
    "key" : "${ssh_key}"
}
EOF
```

Copy the following to `~/.ssh/config`:

```config
####
# IMAGINATE LABS
####
Host github.com-il
  User anthony.scata@imaginatelabs.com
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/anthonyscata_imaginatelabs_github
  IdentitiesOnly yes
```

## Clone the repo

```bash
mkdir -p ~/Code/ImaginateScata/github.com
cd ~/Code/ImaginateScata/github.com
git clone git@github.com-il:ImaginateScata/dotfiles.git
cd dotfiles
```

## Usage

```bash
./bin/install_xcode.sh
./bin/install_homebrew.sh
./bin/post_install.sh
./bin/links.sh
daily
```

The first run of daily will contains some errors as the zsh plugins aree not yet installed.
After the second no errors should appear.

## iTerm Settings

Some settings in iTerm need to be tweeked:

* Appearance -> General -> Theme: Minimal
* Appearance -> Tabs -> Show tab bar in fullscreen
* Profile -> Colors -> Color Presents -> Solarized Dark
* Profile -> Text -> Use built-in Powerline glyphs
* Profile -> Text -> Font -> 12
* Profile -> Keys -> Delete key sends ^H -> Esc+
* Profile -> Keys -> Presets -> Terminal.app Compatiability

## Visual Studio Code

### Extensions

* Docker : ms-azuretools.vscode-docker
* AWS Cloudformation : aws-scripting-guy.cform
* Markdown Preview : shd101wyy.markdown-preview-enhanced
* Markdown linter : davidanson.vscode-markdownlint
* YAML : redhat.vscode-yaml
* ignore : syler.ignore
* Kubernetes : ms-kubernetes-tools.vscode-kubernetes-tools
* go : ms-vscode.go
* Settings sync : shan.code-settings-sync options+shift+u
* Git lens : eamodio.gitlens
* shell-format :foxundermoon.shell-format


### Settings

Using settings sync, copy down the settings from [ImaginateScata](https://gist.github.com/ImaginateScata/0808d89e8b0d2f724f3b76a1a96b7905)

## Chrome Extensions

* [One Tab](https://chrome.google.com/webstore/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall?hl=en)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en)
* [Lastpass](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)
* [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp?hl=en)
* [Okta](https://chrome.google.com/webstore/detail/okta-browser-plugin/glnpjglilkicbckjpbgcfkogebgllemb?hl=en)

### Remove

* Google Docs Offline
* Docs
* Sheets
* Slides

## Firefox Extenstions

* [One Tab](https://addons.mozilla.org/en-US/firefox/addon/onetab/)
* [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
* [LastPass](https://addons.mozilla.org/en-US/firefox/addon/lastpass-password-manager/)
* [HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/)
* [Okta](https://addons.mozilla.org/en-US/firefox/addon/okta-browser-plugin/)
