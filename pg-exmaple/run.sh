#!/bin/bash

set -o allexport
source envrc
set +o allexport

echo "----------------------------------------"
echo "This is a step by step script"
echo "in any steps, you can type Ctrl+C to exit or type any key to continue"
echo "(we use \`read -n 1\` to wait you to check what just happend on your machine)"
echo "https://github.com/cloudnative-pg/cloudnative-pg/"
echo "https://www.gabrielebartolini.it/articles/2024/08/cnpg-recipe-12-exposing-postgres-outside-kubernetes-with-service-templates/"
echo "----------------------------------------"
echo "ready to go?"
read -n 1


set +x
echo "----------------------------------------"
echo "prepare cloudnative-pg crd"
echo "kubectl apply --server-side cloudnative-pg"
echo "----------------------------------------"
read -n 1
set -x

kubectl apply --server-side -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/releases/cnpg-1.25.0.yaml


set +x
echo "----------------------------------------"
echo "check what crd installed kubectl get customresourcedefinitions.apiextensions.k8s.io"
echo "----------------------------------------"
read -n 1
set -x

kubectl get customresourcedefinitions.apiextensions.k8s.io

set +x
echo "----------------------------------------"
echo "kubectl apply for pg instances"
echo "----------------------------------------"
read -n 1
set -x
kubectl apply -f pq.yaml

set +x
echo "----------------------------------------"
echo "run watch to monitor"
echo "----------------------------------------"
read -n 1
set -x

watch kubectl get all

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
