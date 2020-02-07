# MY SOCIAL

## AZURE
alias azure_login='docker run -it --rm --volume "${HOME}/.azure_social":"/root/.azure" microsoft/azure-cli az login'
alias azure_login_sp='docker run -it --rm --volume "${HOME}/.azure_social":"/root/.azure" microsoft/azure-cli az login --service-principal --username 65741c4c-dcdd-4ae1-af7f-03ed642399bf --password a88a02bf-1f60-4555-b9b2-e88b4bf39203 --tenant f64b62d5-b1ad-4d52-a216-3fa843709765 --allow-no-subscriptions'
alias azure_start='docker run -it --rm --volume "${HOME}/.azure_social":"/root/.azure" microsoft/azure-cli'
