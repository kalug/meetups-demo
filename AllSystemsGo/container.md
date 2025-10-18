# container


## Unprivileged Containers, with Transient User Namespaces and ID Mapping, but Without SETUID Binaries

Day 2 10:00

Lennart Poettering


- <https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/E7FHPY/resources/Unprivileged_Containers_with_Transient__gdXDs9f.pdf>
- <https://www.youtube.com/watch?v=lkZWBxBaJJs>


## A new systemd container runtime?! 

Day 1 16:45-17:10

Daan De Meyer (Meta)

At Meta, we've been looking to revamp our internal container runtime (Twine). Instead of maintaining all the low level container runtime code ourselves, we'd much prefer having more of this managed by systemd. This talk will go over what we did to make systemd transient units a suitable environment for running system containers (pid namespace support, cgroup namespace support, namespace delegation, ...), and why we went this route instead of reusing systemd-nspawn.


https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/BBTJSF/resources/A_new_systemd_container_runtime__CdIPOZC.pdf


## systemd-confext Two Years On: Versioned Overlays for /etc, Reloaded systemd-confext Two Years On: Versioned Overlays for /etc, Reloaded 

Day 1 12:25
Maanya Goenka (Microsoft)

- systemd 256

https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/GSRYLR/resources/asg_2025_confext-4_2a7RaBZ.pdf

## Extending Fedora Atomic Desktops using systemd system extensions
Day 1 14:20

Timothée Ravier (RHEL)

https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/DCVQLK/resources/2025_All_Systems_Go_-_Extending_Fedora__dRwVS5y.pdf
https://asciinema.org/a/745601
https://github.com/travier/sysexts-manager


## Integrating systemd-sysext images in an update stack
Day 1 14:50
Thorsten Kukuk (Suse)

https://www.youtube.com/watch?v=PQfekK3sj0U
https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/8AA87L/resources/ASG2025-sysext_XhmQmfR.pdf

