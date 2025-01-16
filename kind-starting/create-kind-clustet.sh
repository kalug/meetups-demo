#!/bin/bash

set -o allexport
source envrc
set +o allexport

echo "----------------------------------------"
echo "This is a step by step script"
echo "in any steps, you can type Ctrl+C to exit or type any key to continue"
echo "(we use \`read -n 1\` to wait you to check what just happend on your machine)"
echo "----------------------------------------"
echo "ready to go?"
read -n 1


# fetch release binary
echo "----------------------------------------"
echo "check commands (kind & cloud-provider-kind) or download them into ~/bin?"
echo "----------------------------------------"
read -n 1
set -x

mkdir -p ~/bin
test -f ~/bin/kind || (curl -Lo ~/bin/kind https://kind.sigs.k8s.io/dl/v${KIND_VER}/kind-linux-amd64 && chmod +x ~/bin/kind)
test -f ~/bin/cloud-provider-kind || (curl -Lo /tmp/cloud-provider-kind.tgz https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v${CLOUD_PROVIDER_KIND_VER}/cloud-provider-kind_${CLOUD_PROVIDER_KIND_VER}_linux_amd64.tar.gz && tar zxvf /tmp/cloud-provider-kind.tgz -C ~/bin cloud-provider-kind)

command -v kind || export PATH=$HOME/bin:$PATH


##########################################################
set +x
echo "----------------------------------------"
echo "ready to \`kind create cluster?\`"
echo "----------------------------------------"
read -n 1
set -x

echo "ensure max_user_instances is enough, defualt: might be 128, https://kind.sigs.k8s.io/docs/user/known-issues/#pod-errors-due-to-too-many-open-files"
set -x
cat /proc/sys/fs/inotify/max_user_instances
kind create cluster -n ${CLUSTER_NAME}
##########################################################

set +x
echo "----------------------------------------"
echo "check cluster to run \`kind get clusters\`"
echo "----------------------------------------"
read -n 1
set -x

kind get clusters


set +x
echo "----------------------------------------"
echo "Check nodes in cluster \`kubectl get nodes\`"
echo "----------------------------------------"
read -n 1
set -x

kubectl get nodes

set +x
echo "----------------------------------------"
echo "Check what is running in podman"
echo "you should see something like:"
echo "'''"
echo "73ae...  docker.io/kindest/node@sha256:...     6 minutes ago  Up 6 minutes  127...->6443/tcp  kalug-control-plane"
echo "----------------------------------------"
echo "'''"
read -n 1
set -x

podman ps

set +x
echo "----------------------------------------"
echo "podman inspect ${CLUSTER_NAME}-control-plane"
echo "----------------------------------------"
read -n 1
set -x

podman inspect ${CLUSTER_NAME}-control-plane | jq | less

set +x
echo "----------------------------------------"
echo "show control-plane ip"
echo "----------------------------------------"
read -n 1
set -x
podman inspect ${CLUSTER_NAME}-control-plane | jq  .[0].NetworkSettings.Networks.kind.IPAddress
