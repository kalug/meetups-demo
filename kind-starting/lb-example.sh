#!/bin/bash

set -o allexport
source envrc
set +o allexport

echo "----------------------------------------"
echo "Once you create kind cluster by create-kind-clustet.sh"
echo "Let's run example from cloud-provider-kind upstream"
echo "----------------------------------------"
echo "ready to go?"
read -n 1

set +x
echo "----------------------------------------"
echo "create namespace lb-example"
echo "----------------------------------------"
read -n 1
set -x

kubectl create namespace lb-example


set +x
echo "----------------------------------------"
echo "switch default namespace as lb-example"
echo "----------------------------------------"
read -n 1
set -x

kubectl config set-context --current --namespace="lb-example"

set +x
echo "----------------------------------------"
echo "apply loadbalancer_etp_local.yaml examle form upstream"
echo "for cloud-provider-kind v0.4.0, need to upgrade to v0.5.0 for podman"
echo " - https://github.com/kubernetes-sigs/cloud-provider-kind/pull/152"
echo " - https://github.com/kubernetes-sigs/cloud-provider-kind/issues/146"
echo " - https://github.com/kubernetes-sigs/cloud-provider-kind/issues/186"
echo "----------------------------------------"
read -n 1
set -x
test -f loadbalancer_etp_local.yaml || curl -LO https://raw.githubusercontent.com/kubernetes-sigs/cloud-provider-kind/refs/heads/main/examples/loadbalancer_etp_local.yaml
kubectl apply -f loadbalancer_etp_local.yaml

set +x
echo "----------------------------------------"
echo "check what apply"
echo "----------------------------------------"
read -n 1
set -x

kubectl get all

set +x
echo "----------------------------------------"
echo "wait lb ready"
echo "https://kubernetes.io/docs/reference/kubectl/generated/kubectl_wait/"
echo " if you wait too long, please check cloud-provider-kind working status"
echo "----------------------------------------"
read -n 1
set -x
kubectl wait --for=jsonpath='{.status.loadBalancer.ingress}' service/lb-service-local


set +x
echo "----------------------------------------"
echo "kubectl get service lb-service-local -o json"
echo "----------------------------------------"
read -n 1
set -x
kubectl get service lb-service-local -o json | jq .

set +x
echo "----------------------------------------"
echo "e2e test - run curl"
echo "----------------------------------------"
read -n 1
set -x
curl -i $(kubectl get service lb-service-local -o json | jq -r .status.loadBalancer.ingress[0].ip)


set +x
echo "----------------------------------------"
echo "let's see what cloud-provider-kind doing"
echo " - once service created, there would be a kindccm 1x1 to handle"
echo "----------------------------------------"
read -n 1
set -x

podman ps
