### Prepare and related commands

download kind, cloud-provider-kind, kubectl

```
export BIN_PATH=/usr/local/bin

export KIND_VER=0.26.0
export CLOUD_PROVIDER_KIND_VER=0.5.0

curl -Lo ${BIN_PATH}/kind https://kind.sigs.k8s.io/dl/v${KIND_VER}/kind-linux-amd64 && chmod +x ${BIN_PATH}/kind
curl -Lo /tmp/cloud-provider-kind.tgz https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v${CLOUD_PROVIDER_KIND_VER}/cloud-provider-kind_${CLOUD_PROVIDER_KIND_VER}_linux_amd64.tar.gz && tar zxvf /tmp/cloud-provider-kind.tgz -C ${BIN_PATH} cloud-provider-kind
curl -Lo ${BIN_PATH}/kubectl "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```{{exec}}

### kind create cluster


ensure max_user_instances is enough, defualt: might be 128, https://kind.sigs.k8s.io/docs/user/known-issues/#pod-errors-due-to-too-many-open-files
```
cat /proc/sys/fs/inotify/max_user_instances
```{{exec}}

create cluster
Since killercode supports podman and docker, we choice podman as our container runtime.

```
export KIND_EXPERIMENTAL_PROVIDER=podman
kind create cluster -n ${CLUSTER_NAME}
```{{exec}}

### check cluster status

```
kind get clusters
```{{exec}}

```
kubectl get nodes
```
  
```
podman ps
```

```
export CLUSTER_NAME=kalug
podman inspect ${CLUSTER_NAME}-control-plane | jq | less
```

```
podman inspect ${CLUSTER_NAME}-control-plane | jq  .[0].NetworkSettings.Networks.kind.IPAddress
```
