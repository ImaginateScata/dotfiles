# DOCKER

## CLEANUP
alias docker_clean_images='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias docker_clean_volumes='docker volume rm $(docker volume ls -qf dangling=true)'
alias docker_clean_containers='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'

## RUN HELPERS
alias dr='docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd"'
alias drs='docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd --entrypoint=/bin/sh'
alias drb='docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd --entrypoint=/bin/bash'
