# DOCKER

## CLEANUP
alias docker_clean_images='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias docker_clean_volumes='docker volume rm $(docker volume ls -qf dangling=true)'
alias docker_clean_containers='docker rm $(docker ps -qa --no-trunc --filter "status=exited")'

## RUN HELPERS
alias dr='docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd --volume "${HOME}/.aws":/root/.aws --volume "${HOME}/.kube":/root/.kube'
alias drs='docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd --volume "${HOME}/.aws":/root/.aws --volume "${HOME}/.kube":/root/.kube --entrypoint=/bin/sh'
alias drb='docker run -it --rm --volume "${PWD}":/pwd --workdir=/pwd --volume "${HOME}/.aws":/root/.aws --volume "${HOME}/.kube":/root/.kube --entrypoint=/bin/bash'

# when running a local proxy
# -e "http_proxy=docker.for.mac.host.internal:3128" -e "https_proxy=docker.for.mac.host.internal:3128" -e "no_proxy=localhost,127.0.0.1,192.168.65.0/24,*.docker.internal,kind-control-plane"

# change helm 3 version with symlink
# helm3_on() { ln -sf "$(find /usr/local/Cellar/helm/3.*/bin/helm -name 'helm')" /usr/local/bin/helm }

# change kubectl version with symlink
# kubectl_on() { ln -sf "$(find /usr/local/Cellar/kubernetes-cli/1.*/bin/kubectl -name 'kubectl')" /usr/local/bin/kubectl }
