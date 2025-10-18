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

## 
