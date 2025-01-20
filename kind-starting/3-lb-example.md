### run LoadBalancer

create namespace to isolate tests

```
kubectl create namespace lb-example
```{{exec}}

set default namespace as lb-example

```
kubectl config set-context --current --namespace="lb-example"
```{{exec}}


apply loadbalancer_etp_local.yaml examle form upstream
for cloud-provider-kind v0.4.0, need to upgrade to v0.5.0 for podman
 - https://github.com/kubernetes-sigs/cloud-provider-kind/pull/152
 - https://github.com/kubernetes-sigs/cloud-provider-kind/issues/146
 - https://github.com/kubernetes-sigs/cloud-provider-kind/issues/186

```
test -f loadbalancer_etp_local.yaml || curl -LO https://raw.githubusercontent.com/kubernetes-sigs/cloud-provider-kind/refs/heads/main/examples/loadbalancer_etp_local.yaml
kubectl apply -f loadbalancer_etp_local.yaml
```{{exec}}


wait lb ready

```
kubectl wait --for=jsonpath='{.status.loadBalancer.ingress}' service/lb-service-local
```{{exec}}

```
kubectl get service lb-service-local -o json | jq .
```{{exec}}

e2e test - run curl

```
curl -i $(kubectl get service lb-service-local -o json | jq -r .status.loadBalancer.ingress[0].ip)
```{{exec}}

```
kubectl get all
```{{exec}}

let's see what cloud-provider-kind doing
 - once service created, there would be a kindccm 1x1 to handle

```
podman ps
```{{exec}}
