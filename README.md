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

## Fix terminal font

Download [powerline](https://github.com/powerline/powerline/tree/develop/font) font.
Set the terminal default font to `Source Code Pro for Powerline` font size 12.

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
* Profile -> Other Actions... -> Import JSON Profiles... -> Solarized Dark.terminal
* Profile -> Other Actions... -> Set as Default
* Profile -> Colors -> Color Presents -> Import... -> Solarized Dark.itermcolors

## Terminal Settings

* Preferences -> Profiles -> Import -> Solarized Dark.terminal
* Preferences -> Profiles -> Solarized Dark.terminal -> Default

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
* shell-format : foxundermoon.shell-format
* Code Spell ChecK : streetsidesoftware.code-spell-checker
* Python : ms-python.python

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

### Settings

* Offer to save passwords - off

## Firefox Extenstions

* [One Tab](https://addons.mozilla.org/en-US/firefox/addon/onetab/)
* [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
* [LastPass](https://addons.mozilla.org/en-US/firefox/addon/lastpass-password-manager/)
* [HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/)
* [Okta](https://addons.mozilla.org/en-US/firefox/addon/okta-browser-plugin/)

### Settings

* Ask to save logins and passwords - Off

## SourceTree

Due to a bug in sourcetree 4.x the terminal button does not open the reposiotry path. This is due to a
permissions issue. To fix this download a [previous](https://www.sourcetreeapp.com/download-archives)
version of sourcetree, open the application (do not move to applications folder), open a repository
and click the terminal button. This will request the correct macOS permission to open iTerm2. Verify
it opens to the correct terminal, quit and open the latest version and ensure that works.

## Mac Settings

### General

Remove unused from showing in dock

* System Preferences -> General -> Appearance: -> Dark
* System Preferences -> General -> Default web browser: -> Google Chrome
* System Preferences -> Dock -> Show recent applications in Dock -> Untick

On the dock drag down,
* Applications -> Name, Folder, Grid
* Downloads -> Date Added, Folder, Grid
* Home -> Name, Folder, Grid

### Bluebooth Keyboard

When using a windows based keyboard the modifier keys need to be changed.
Ensure the keyboard is syned and change only the bluetooth keyboard modifier keys.

* System Preferences -> Keyboard -> Modifier Keys ... -> Option key -> Command
* System Preferences -> Keyboard -> Modifier Keys ... -> Command key -> Option

### Touch Bar

* System Preferences -> Keyboard -> Customise Control Strip
* Minimised: Brightness Slider, Mute, Volume Slider, Screen Lock
* Maximised: Space, Keyboard Brightness, Brightness, Mute, Volume Slider, Show Desktop,
Screenshot, Sreen Lock, Space


### Finder Preferences

* Finder -> Preferences -> General -> Hard disks
* Finder -> Preferences -> Sidebar -> <username>

### Touch ID

* System Preferences -> Touch ID

Add each finger, suggest Right Index, Right Middle, Left Index

### Notifications

* System Preferences -> Notifications -> Notification Centre sort order: Recent by App
* Right Menu -> Today -> Remove all but weather (add location)

### Top bar

Battery -> Show Percentage
Time -> Open Date & Time Preferences -> Clock -> Display the time with seconds
Time -> Open Date & Time Preferences -> Clock -> Show date
