# dotfiles

My dot files and OSX bootstrap scripts.


## Setting up github.com

Set up ssh key:
```shell script
ssh-keygen -t rsa -b 4096 -C "anthony.scata@imaginatelabs.com" -f "${HOME}/.ssh/anthonyscata_imaginatelabs_github"
```

Copy public key into variable:
```shell script
ssh_key=$(<~/.ssh/anthonyscata_imaginatelabs_github.pub)
```

Create a Personal access token from [github tokens](https://github.com/settings/tokens) with the `write:public_key`
permissions. Copy the key contents into the variable `github_access_token`.

Upload the public key into github: 
```shell script
curl -i -H"Authorization: token ${github_access_token}" --data @- https://api.github.com/user/keys << EOF
{
    "title" : "$(scutil --get LocalHostName) $(date)",
    "key" : "${ssh_key}"
}
EOF
```

Copy the following to `~/.ssh/config`:
```
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

```
$ mkdir -p ~/Code/ImaginateScata/github.com
$ cd ~/Code/ImaginateScata/github.com
$ git clone git@github.com-il:ImaginateScata/dotfiles.git
$ cd dotfiles
```


## Usage

```
$ ./bin/install_xcode.sh
$ ./bin/install_homebrew.sh
$ ./bin/post_install.sh
$ ./bin/links.sh
$ daily
```
