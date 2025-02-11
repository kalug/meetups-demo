

https://github.com/kubernetes-sigs/kind/blob/main/site/static/examples/config-with-mounts.yaml

```
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  # add a mount from /path/to/my/files on the host to /files on the node
  extraMounts:
  - hostPath: /path/to/my/files
    containerPath: /files
```

kind export kubeconfig --name a --kubeconfig   $HOME/.kube/kind-a.yaml


https://medium.com/opsops/accessing-host-system-systemd-from-containers-systemctl-492a1a385102

docker --privileged -v /run:/run debian
SYSTEMCTL_FORCE_BUS=1 systemctl status
