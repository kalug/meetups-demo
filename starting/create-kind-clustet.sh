#!/bin/sh -x

echo "download kind & cloud-provider-kind"

KIND_VER=0.26.0
CLOUD_PROVIDER_KIND_VER=0.5.0
CLUSTER_NAME=kalug

mkdir -p ~/bin
# fetch release binary
test -f ~/bin/kind || (curl -Lo ~/bin/kind https://kind.sigs.k8s.io/dl/v${KIND_VER}/kind-linux-amd64 && chmod +x ~/bin/kind)
test -f ~/bin/cloud-provider-kind || (curl -Lo /tmp/cloud-provider-kind.tgz https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v${CLOUD_PROVIDER_KIND_VER}/cloud-provider-kind_${CLOUD_PROVIDER_KIND_VER}_linux_amd64.tar.gz && tar zxvf /tmp/cloud-provider-kind.tgz -C ~/bin cloud-provider-kind)

command -v kind || export PATH=$HOME/bin:$PATH


########################################
echo "ready to create kind cluster?"
read -n 1

cat /proc/sys/fs/inotify/max_user_instances
# ensure max_user_instances is enough
(kind get clusters |grep ${CLUSTER_NAME}) || kind create cluster -n ${CLUSTER_NAME}


########################################
echo "ready to kind get clusters"
read -n 1

kind get clusters
