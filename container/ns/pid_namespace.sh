#!/bin/bash

# This script demonstrates PID namespace isolation.

echo "--- Original PID Namespace ---"
echo "Current PID: $$"
echo "Parent PID (PPID): $(ps -o ppid= -p $$)"
echo "Listing all processes in current namespace:"
ps -ef

echo -e "
--- Creating a new PID Namespace (using unshare) ---"
echo "Running 'sleep 60' in a new PID namespace and then listing processes."
echo "You will see that the 'sleep' process has PID 1 inside the new namespace."
echo "Press Ctrl+C to exit the new namespace shell."

# Using unshare to create a new PID namespace
# -f: Fork the process
# -p: Create a new PID namespace
# --mount-proc: Mount /proc filesystem in the new namespace
# bash: Start a new bash shell in the new namespace
unshare --fork --pid --mount-proc bash -c "echo 'Inside new PID namespace:'; ps -ef; sleep 60 & echo 'Sleep process PID: $!'; wait $! || true; echo 'Exiting new PID namespace';"

echo -e "
--- Back to Original PID Namespace ---"
echo "Listing all processes in original namespace (sleep process should not be PID 1 here):"
ps -ef
echo "Notice that the 'sleep 60' process started in the new namespace appears with a different PID here."
