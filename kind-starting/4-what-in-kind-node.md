### what's in kind node

```
podman exec -it ${CLUSTER_NAME}-control-plane sh -c "pstree || (apt update && apt install psmisc && pstree)"
```{{exec}}

default kind container runtime CRI is containerd
we can run containerd cli - ctr

```
podman exec -it ${CLUSTER_NAME}-control-plane ctr -n k8s.io c ls
```{{exec}}

Or run Kubernetes CRI cli - crictl
https://kubernetes.io/docs/tasks/debug/debug-cluster/crictl/

```
podman exec -it ${CLUSTER_NAME}-control-plane crictl pods
```{{exec}}

shell into control-plane

```
podman exec -it ${CLUSTER_NAME}-control-plane bash
```{{exec}}
