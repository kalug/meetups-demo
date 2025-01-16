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


set +x
echo "----------------------------------------"
echo "ready to \`kind create cluster?\`"
echo "----------------------------------------"
read -n 1
set -x

kind create cluster --config kind-multi-nodes.config --name multi-nodes -v 3

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
echo "----------------------------------------"
read -n 1
set -x

podman ps

set +x
echo "----------------------------------------"
echo "kubectl describe node multi-nodes-control-plane"
echo "----------------------------------------"
read -n 1
set -x

kubectl describe node multi-nodes-control-plane
