# dotfiles

My dot files and OSX bootstrap scripts.

Currently works for macOS Monterey 12 with Apple Silicon

## Setting up github.com

```bash
mkdir ~/.ssh
```

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

## Fresh install no go

On a fresh install `git` is not present so you cannot clone the repository. To overcome this, copy the contents of
[install_xcode.sh](https://github.com/ImaginateScata/dotfiles/blob/master/bin/install_xcode.sh) to your local machine
under the file `${HOME}/install_xcode.sh`. This will install the command line tools for you.

Now execute:

```bash
bash ${HOME}/install_xcode.sh
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
./bin/install_rosetta.sh
./bin/install_homebrew.sh
source ${HOME}/.zshrc
./bin/links.sh
./bin/post_install.sh
```

Cleanup the tooling and install all of the brew packages:

```bash
source ${HOME}/.zshrc
daily
```

## iTerm Settings

Some settings in iTerm need to be tweaked:

* Appearance -> General -> Theme: Minimal
* Appearance -> Tabs -> Show tab bar in fullscreen
* Profile -> Other Actions... -> Import JSON Profiles... -> Basic.terminal

## Terminal Settings

* Preferences -> Profiles -> Import -> Basic.terminal

## Visual Studio Code

### Extensions

* Settings sync : shan.code-settings-sync (options+shift+u to upload)

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

## Firefox Extensions

* [One Tab](https://addons.mozilla.org/en-US/firefox/addon/onetab/)
* [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
* [LastPass](https://addons.mozilla.org/en-US/firefox/addon/lastpass-password-manager/)
* [HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/)

## Brave Extensions

* [One Tab](https://chrome.google.com/webstore/detail/onetab/chphlpgkkbolifaimnlloiipkdnihall)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm)
* [LastPass](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd)
* [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp)

## Opera Extensions

* [One Tab](https://addons.opera.com/en/extensions/details/open-tabs/)
* [uBlock Origin](https://addons.opera.com/en/extensions/details/ublock/)
* [LastPass](https://addons.opera.com/en/extensions/details/lastpass/)
* [HTTPS Everywhere](https://addons.opera.com/en/extensions/details/https-everywhere/)

### Settings

* Ask to save logins and passwords - Off

## SourceTree

Due to a bug in sourcetree 4.x the terminal button does not open the reposiotry path. This is due to a
permissions issue. To fix this download a [previous](https://www.sourcetreeapp.com/download-archives)
version of sourcetree, open the application (do not move to applications folder), open a repository
and click the terminal button. This will request the correct macOS permission to open iTerm2. Verify
it opens to the correct terminal, quit and open the latest version and ensure that works.

### Preferences old version

* Preferences -> General -> Terminal app -> Term2
* Open a repo from the "Terminal" menu

Delete old sourcetree application

## Mac Settings

### General

Remove unused from showing in dock

* System Preferences -> General -> Appearance: -> Dark
* System Preferences -> General -> Default web browser: -> Google Chrome
* System Preferences -> Dock & Menu Bar -> Show recent applications in Dock -> Untick

On the dock drag down,

* Applications -> Name, Folder, Grid
* Downloads -> Date Added, Folder, Grid
* Home -> Name, Folder, Grid

* Finder -> shift+command+h -> command+up -> Drag below downloads
* Finder -> Preferences -> General -> Hard disk -> Tick
* Finder -> Preferences -> Sidebar -> Locations -> MacBook Pro

### Bluebooth Keyboard

When using a windows based keyboard the modifier keys need to be changed.
Ensure the keyboard is syned and change only the bluetooth keyboard modifier keys.

* System Preferences -> Keyboard -> Modifier Keys ... -> Option key -> Command
* System Preferences -> Keyboard -> Modifier Keys ... -> Command key -> Option

### Touch ID

* System Preferences -> Touch ID

Add each finger, suggest Right Index, Right Middle, Left Index

### Notifications

* System Preferences -> Notifications -> Notification Centre sort order: Recent by App
* Right Menu -> Today -> Remove all but weather (add location)

### Top bar

System Preferences -> Dock & Menu Bar -> Battery -> Show Percentage
System Preferences -> Dock & Menu Bar -> Bluetooth -> Show in Menu Bar
System Preferences -> Dock & Menu Bar -> Clock -> Display the time with seconds
System Preferences -> Dock & Menu Bar -> Clock -> Show date
System Preferences -> Dock & Menu Bar -> Time Machine -> Show in Menu Bar

## Google Drive

Stream files

## f.lux

Classic f.lux
6:00am
Start f.lux at login
