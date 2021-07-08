## PROXY
a_proxy_start() { alpaca -u ${USER} -C "${PROXY_URL}" > /dev/null 2>&1 & ; a_proxy_set ; a_proxy_network_on ; }
a_proxy_start_fg() { a_proxy_set ; a_proxy_network_on ; alpaca -u ${USER} -C "${PROXY_URL}" 2>&1 & }
a_proxy_stop() { ps -ef | grep "alpaca -u" | grep -v -e grep | awk '{print $2}' | xargs kill ; a_proxy_unset ; a_proxy_network_off ;}
a_proxy_restart() { a_proxy_stop ; a_proxy_start ; }

a_proxy_bypass="localhost,127.0.0.1,192.168.64.0/24,*.docker.internal,kind-control-plane"
a_proxy_hostname="localhost"
a_proxy_port="3128"

a_proxy_set() { export http_proxy=${a_proxy_hostname}:${a_proxy_port} https_proxy=${a_proxy_hostname}:${a_proxy_port} no_proxy=${a_proxy_bypass} ALL_PROXY=${a_proxy_hostname}:${a_proxy_port} ; }
a_proxy_unset() { unset http_proxy https_proxy no_proxy ALL_PROXY ; }

a_proxy_network_on() { sudo networksetup -setautoproxyurl wi-fi "http://${a_proxy_hostname}:${a_proxy_port}/alpaca.pac" ; }
a_proxy_network_off() { sudo networksetup -setautoproxyurl wi-fi "${PROXY_URL}" ; }

a_chrome_proxy() { open -a "Google Chrome" --args --proxy-server=${a_proxy_hostname}:${a_proxy_port} ; }

code() { /usr/local/bin/code --proxy-server="${a_proxy_hostname}:${a_proxy_port}" --proxy-bypass-list ${a_proxy_bypass} "$@" ;}

a_gcloud_set() { gcloud config set project "${1}" ; }
a_gcloud_set_ob_stg() { a_gcloud_set "a-c-ostg-831a3b" ; }
a_gcloud_set_ob_npe() { a_gcloud_set "a-c-onp-5f1458" ; }
a_gcloud_set_ob_pp() { a_gcloud_set "a-c-opp-36584a" ; }
a_gcloud_set_ob_prod() { a_gcloud_set "a-c-oprod-ea15fc" ; }

a_gcloud_set_ob_zc_stg() { a_gcloud_set "a-b-o-stg-535be6" ; }
a_gcloud_set_ob_zc_npe() { a_gcloud_set "a-b-o-np-3d6bf4" ; }
a_gcloud_set_ob_zc_prod() { a_gcloud_set "a-b-o-prod-xxx" ; }

## OB Clusters
a_rename() { KUBECONFIG="${cluster_config_path}/${1}" kubectl config rename-context "gke_${3}_australia-southeast1_${2}" "${3}" ; }
a_ob() { a_ob_delete "${1}" "${3}" ; gcr ; KUBECONFIG="${cluster_config_path}/${1}" gcloud container clusters get-credentials "${2}" --region australia-southeast1 --project "${3}" --internal-ip ; a_rename "${1}" "${2}" "${3}" ; a_kube_set_path ; }
a_ob_npe() { a_ob "config_ob_npe" "a-c-onp-gke" "a-c-onp-5f1458" ; a_ob_set_npe ; }
a_ob_pp() { a_ob "config_ob_pp" "a-c-opp-gke" "a-c-opp-36584a" ; a_ob_set_pp ; }
a_ob_stg() { a_ob "config_ob_stg" "a-c-ostg-gke" "a-c-ostg-831a3b" ; a_ob_set_stg ; }
a_ob_prod() { a_ob "config_ob_prod" "a-c-oprod-gke" "a-c-oprod-ea15fc" ; a_ob_set_prod ; }

a_ob_zc_npe() { a_ob "config_ob_zc_npe" "a-b-o-np-gke" "a-b-o-np-3d6bf4" ; a_ob_set_zc_npe ; }
a_ob_zc_stg() { a_ob "config_ob_zc_stg" "a-b-o-stg-gke" "a-b-o-stg-535be6" ; a_ob_set_zc_stg ; }
a_ob_zc_prod() { a_ob "config_ob_zc_prod" "a-b-o-prod-gke" "a-b-o-prod-xxx" ; a_ob_set_zc_prod ; }

a_ob_set() { export KUBECONFIG="${cluster_config_path}/${1}" ; }
a_ob_set_npe() { a_ob_set "config_ob_npe" ; }
a_ob_set_pp() { a_ob_set "config_ob_pp" ; }
a_ob_set_stg() { a_ob_set "config_ob_stg" ; }
a_ob_set_prod() { a_ob_set "config_ob_prod" ; }

a_ob_set_zc_npe() { a_ob_set "config_ob_zc_npe" ; }
a_ob_set_zc_stg() { a_ob_set "config_ob_zc_stg" ; }
a_ob_set_zc_prod() { a_ob_set "config_ob_zc_prod" ; }

a_ob_delete() { KUBECONFIG="${cluster_config_path}/${1}" kubectl config delete-context "${2}" ; }
a_ob_delete_npe() { a_ob_delete "config_ob_npe" "a-c-onp-5f1458" ; }
a_ob_delete_pp() { a_ob_delete "config_ob_pp" "a-c-opp-36584a" ; }
a_ob_delete_stg() { a_ob_delete "config_ob_stg" "a-c-ostg-831a3b" ; }
a_ob_delete_prod() { a_ob_delete "config_ob_prod" "a-c-oprod-ea15fc" ; }

a_ob_delete_zc_npe() { a_ob_delete "config_ob_zc_npe" "a-b-o-np-3d6bf4" ; }
a_ob_delete_zc_stg() { a_ob_delete "config_ob_zc_stg" "a-b-o-stg-535be6" ; }
a_ob_delete_zc_prod() { a_ob_delete "config_ob_zc_prod" "a-b-o-prod-xxx" ; }

cluster_config_path="${HOME}/.kube"
a_kube_set_path() { export KUBECONFIG="$(find "${cluster_config_path}" -type f -name 'config_*' | sort | paste -s -d: - ):${HOME}/.kube/config" ; }

## GCLOUD
### Shortcut to log in, gal == gcloud auth login
gal() { gcloud auth login && gcloud projects list > /dev/null && echo "connected"; }

### Shortcut to see if token active, 0 success; 1 error, gli == gcloud auth list
gli() {
  if [[ $(gcloud auth list --filter=status:ACTIVE --format="value(account)" | wc -c) -ne 0 ]]; then
    return 0
  fi
  return 1
}

### Shortcut to reauth, if needed will reauth, if no returns, gcr == gcloud check reauth
gcr() {
    gli || gal
}
