# systemd main project

## A Security Model for systemd

- Day 1 09:30
- Lennart Poettering (Microsoft)

> In this talk I'd like to start changing this, and begin defining some general **security design guidelines** that we so far mostly followed implicitly, and make them more explicit.
> After all, systemd to a large degree is involved in security subsystems, from SecureBoot, Measured Boot & TPM, to its service sandboxing, dm-verity/dm-crypt support, its FIDO2/PKCS#11 hookups, its many security boundaries, secure parameterization, Linux Security Module initialization and more.

### universal truths make simple P.9 P.20
- security mechanisms: "Universal" vs. "fine-grained"
- writable XOR executable mounts (superblock W^X) [lsmbpf]

### UNIX/Linux Misdesign P.18 28:00
<https://youtu.be/8lFbM0HYVlw?si=ikqPpUIvI56FEPv0&t=1718>
- SUID (like sudo)
  - writable xor executable P.20
- Capabilities - BSD Capsicum
- Everything is a file
- Netlink
...

### references
- youtube: <https://www.youtube.com/watch?v=8lFbM0HYVlw&t=638s>
- slide: <https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/FE98ZY/resources/A_Security_Model_for_systemd_yVqAHg4.pdf>



## systemd: state of the project


https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/B8RVCJ/resources/ASG_2025_systemd__state_of_the_project_0gjqXGb.pdf


## BPF Tokens in systemd
Day 1 10:45

Matteo Croce (Meta)

- BPF TOKEN - kernel 6.9
- https://www.phoronix.com/news/systemd-258-rc2

new BPF delegate options / tokens for the mount of bpffs:
- BPFDelegateCommands=
- BPFDelegateMaps=
- BPFDelegatePrograms=
- BPFDelegateAttachments=

https://www.youtube.com/watch?v=6vqgEjvE2OQ&t=168s
https://lwn.net/Articles/947173/
https://github.com/systemd/systemd/pull/36134
related: Cross Container Attacks: The Bewildered eBPF on Clouds https://www.usenix.org/system/files/sec23_slides_he.pdf
demo: 14:00


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

