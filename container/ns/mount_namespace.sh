#!/bin/bash

# This script demonstrates Mount namespace isolation.

MOUNT_POINT="/tmp/mynewmount"
TEST_FILE="$MOUNT_POINT/test.txt"

echo "--- Original Mount Namespace ---"
echo "Listing content of /tmp in original namespace:"
ls /tmp

echo -e "
--- Creating a new Mount Namespace (using unshare) ---"
echo "Inside a new mount namespace, we will create a mount point and mount a tmpfs."
echo "This mount will only be visible within the new namespace."

# Using unshare to create a new mount namespace
# -m: Create a new mount namespace
unshare --mount bash -c "\
    echo 'Inside new Mount namespace:'; \
    mkdir -p $MOUNT_POINT; \
    mount -t tmpfs none $MOUNT_POINT; \
    echo 'Created mount point and mounted tmpfs at $MOUNT_POINT'; \
    echo 'Hello from new mount namespace' > $TEST_FILE; \
    ls -l $MOUNT_POINT; \
    echo 'Listing content of /tmp in new namespace:'; \
    ls /tmp; \
    echo 'Press Ctrl+C to exit the new namespace shell and unmount the tmpfs'; \
    sleep 10; \
    umount $MOUNT_POINT; \
    rmdir $MOUNT_POINT; \
    echo 'Exiting new Mount namespace'; \
"

echo -e "
--- Back to Original Mount Namespace ---"
echo "Listing content of /tmp in original namespace:"
ls /tmp
echo "Notice that the mount point and test file created in the new namespace are NOT visible here."
