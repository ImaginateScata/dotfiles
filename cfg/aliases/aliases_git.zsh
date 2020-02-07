# GENERAL
### Squash Commits
# need to be on the integration branch before the inital checkout
# git checkout -b <new_branch>
# git merge --squash <branch_to_squash>
# commit changes

alias git_clean_branches='git fetch; git remote update origin --prune; git checkout master; git fetch -p && git branch -vv | awk "/: gone]/{print $1}" | cut -d " " -f3 | xargs git branch -d'
alias git_clean_branches_force='git fetch; git remote update origin --prune; git checkout master; git fetch -p && git branch -vv | awk "/: gone]/{print $1}" | cut -d " " -f3 | xargs git branch -D'
# alias git_clean_branches='git fetch; git remote update origin --prune; git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
