#!/bin/bash

set -o allexport
source envrc
set +o allexport

echo "----------------------------------------"
echo "Once you create kind cluster by create-kind-clustet.sh"
echo "Let's see what's happened in the kind node"
echo "----------------------------------------"
echo "ready to go?"
read -n 1

set +x
echo "----------------------------------------"
echo "pstree"
echo "----------------------------------------"
read -n 1
set -x

podman exec -it ${CLUSTER_NAME}-control-plane sh -c "pstree || (apt update && apt install psmisc && pstree)"


set +x
echo "----------------------------------------"
echo "default kind container runtime CRI is containerd"
echo "we can run containerd cli - ctr"
echo "----------------------------------------"
read -n 1
set -x

podman exec -it ${CLUSTER_NAME}-control-plane ctr -n k8s.io c ls

set +x
echo "----------------------------------------"
echo "Or run Kubernetes CRI cli - crictl"
echo "https://kubernetes.io/docs/tasks/debug/debug-cluster/crictl/"
echo "----------------------------------------"
read -n 1
set -x

podman exec -it ${CLUSTER_NAME}-control-plane crictl pods

set +x
echo "----------------------------------------"
echo "shell into control-plane"
echo "----------------------------------------"
read -n 1
set -x

podman exec -it ${CLUSTER_NAME}-control-plane bash

