#!/bin/bash

set -o allexport
source envrc
set +o allexport

echo "----------------------------------------"
echo "This is a step by step example for kube-rs"
echo "in any steps, you can type Ctrl+C to exit or type any key to continue"
echo "(we use \`read -n 1\` to wait you to check what just happend on your machine)"
echo ""
echo "https://github.com/kube-rs/kube"
echo "https://github.com/kube-rs/controller-rs"
echo "----------------------------------------"
echo "ready to go?"
read -n 1


set +x
echo "----------------------------------------"
echo "git clone controller-rs"
echo "----------------------------------------"
read -n 1
set -x

test -e controller-rs || git clone https://github.com/kube-rs/controller-rs

set +x
echo "----------------------------------------"
echo "build crdgen and apply"
echo "----------------------------------------"
read -n 1
set -x

pushd controller-rs
cargo run --bin crdgen | kubectl apply -f -
popd

set +x
echo "----------------------------------------"
echo "check what crd been applied"
echo "----------------------------------------"
read -n 1
set -x

kubectl get customresourcedefinitions.apiextensions.k8s.io

set +x
echo "----------------------------------------"
echo "kubectl apply controller"
echo "----------------------------------------"
read -n 1
set -x

cp values.yaml controller-rs/charts/doc-controller/values.yaml
pushd controller-rs
git diff charts/doc-controller/values.yaml
helm template charts/doc-controller | kubectl apply -f -

popd


set +x
echo "----------------------------------------"
echo "waiting for controller ready"
echo "----------------------------------------"
read -n 1
set -x

kubectl wait --for=condition=available deploy/doc-controller --timeout=30s



kubectl port-forward service/doc-controller 8080:80

set +x
echo "----------------------------------------"
echo "run watch to monitor"
echo "----------------------------------------"
read -n 1
set -x

watch kubectl get all


set +x
echo "----------------------------------------"
echo "get secret"
echo "----------------------------------------"
read -n 1
set -x

kubectl get secret cluster-example-app \
  -o jsonpath="{.data.password}" | base64 -d

set +x
echo "----------------------------------------"
echo "run psql"
echo "----------------------------------------"
read -n 1
set -x

psql -h $(kubectl get service cluster-example-rw-lb -o json | jq -r .status.loadBalancer.ingress[0].ip) -U app app
