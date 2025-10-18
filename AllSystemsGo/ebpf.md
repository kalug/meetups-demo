# ebpf

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


## Systing: tracing for the lazy 

Day 1 10:45
Josef Bacik (Anthropic/Meta/Btrfs) https://www.phoronix.com/news/Josef-Bacik-Leaves-Meta

https://github.com/josefbacik/systing

## Container Networking With Netkit: The BPF Programmable Network Device
Day 1 10:15
Mike Willard (Meta)

https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/WAHYE8/resources/Container_Networking_with_Netkit_1_evRicTE.pdf


## A simpler and faster firewall with bpfilter
Day 2 15:20
Quentin Deslandes (Meta)

3:30 iptables problems
11:20 demo

https://github.com/facebook/bpfilter
https://www.youtube.com/watch?v=_ZzCVjrjl94

