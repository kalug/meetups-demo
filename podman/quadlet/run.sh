#!/bin/bash

set -o allexport
test -f envrc && source envrc
set +o allexport

echo "----------------------------------------"
echo "This is a step by step example for podman quadlet"
echo "in any steps, you can type Ctrl+C to exit or type any key to continue"
echo "(we use \`read -n 1\` to wait you to check what just happend on your machine)"
echo ""
echo "https://www.redhat.com/en/blog/quadlet-podman"
echo "----------------------------------------"
echo "ready to go?"
read -n 1


set +x
echo "----------------------------------------"
echo "what is quadlet file"
echo "----------------------------------------"
read -n 1
set -x

less mysleep.container


set +x
echo "----------------------------------------"
echo "Using Quadlet in Podman"
echo "With Quadlet in Podman 4.4, you can create CTRNAME.container unit files that can be placed in one of the following directories:"
echo "- /usr/share/containers/systemd/"
echo "- /etc/containers/systemd/"
echo "for users:"
echo "- $HOME/.config/containers/systemd/"
echo ""
echo "cp mysleep.container into Quadlet dir"
echo "----------------------------------------"
read -n 1
set -x

mkdir -p $HOME/.config/containers/systemd/ && cp mysleep.container $HOME/.config/containers/systemd/

set +x
echo "----------------------------------------"
echo "what will quadlet do?"
echo "----------------------------------------"
read -n 1
set -x

/usr/libexec/podman/quadlet -dryrun -user

set +x
echo "----------------------------------------"
echo "daemon-reload to generate systemd unit"
echo "----------------------------------------"
read -n 1
set -x

systemctl --user daemon-reload

set +x
echo "----------------------------------------"
echo "let run it"
echo "systemctl --user start mysleep.service"
echo "----------------------------------------"
read -n 1
set -x

systemctl --user start mysleep.service

set +x
echo "----------------------------------------"
echo "systemctl --user status mysleep.service"
echo "----------------------------------------"
read -n 1
set -x

systemctl --user status mysleep.service

