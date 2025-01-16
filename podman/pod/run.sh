#!/bin/bash

set -o allexport
test -f envrc && source envrc
set +o allexport

echo "----------------------------------------"
echo "This is a step by step example for podman pod"
echo "in any steps, you can type Ctrl+C to exit or type any key to continue"
echo "(we use \`read -n 1\` to wait you to check what just happend on your machine)"
echo ""
echo "https://developers.redhat.com/blog/2019/01/15/podman-managing-containers-pods#podman_pods__what_you_need_to_know"
echo "----------------------------------------"
echo "ready to go?"
read -n 1


podman run -dt --pod new:kalug-test-pod -p 12480:80 quay.io/libpod/alpine_nginx:latest
podman run -dt --pod kalug-test-pod docker.io/library/alpine:latest top

curl localhost:12480


podman pod create -p 12380:80 kalug-test-pod2
podman run -dt --pod kalug-test-pod2 quay.io/libpod/alpine_nginx:latest
curl localhost:12380


#################
podman kube generate kalug-test-pod

