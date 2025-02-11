
### Run cloud-provider-kind in background

please run cloud-provider-kind in another tab

```
export BIN_PATH=/usr/local/bin

${BIN_PATH}/cloud-provider-kind
```{{exec}}
 

```
mkdir -p ~/.config/systemd/user
cp cloud-provider-kind.service ~/.config/systemd/user

systemctl --user shawn status cloud-provider-kind
systemctl --user shawn start cloud-provider-kind

journalctl --user -u cloud-provider-kind -f
```

```
kubectl label node kind-control-plane node.kubernetes.io/exclude-from-external-load-balancers-
```
