### Prepare and related commands

download kind, cloud-provider-kind, kubectl

```
export BIN_PATH=/usr/local/bin

export KIND_VER=0.26.0
export CLOUD_PROVIDER_KIND_VER=0.5.0

curl -Lo ${BIN_PATH}/kind https://kind.sigs.k8s.io/dl/v${KIND_VER}/kind-linux-amd64 && chmod +x ${BIN_PATH}/kind
curl -Lo /tmp/cloud-provider-kind.tgz https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v${CLOUD_PROVIDER_KIND_VER}/cloud-provider-kind_${CLOUD_PROVIDER_KIND_VER}_linux_amd64.tar.gz && tar zxvf /tmp/cloud-provider-kind.tgz -C ${BIN_PATH} cloud-provider-kind)
curl -Lo ${BIN_PATH}/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```{{exec}}


### Prepare kind, cloud-provider-kind, kubectl and related commands

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
