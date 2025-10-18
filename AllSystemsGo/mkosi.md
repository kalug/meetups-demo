# mkosi & ParticleOS

## Why you should contribute to systemd

- Day 1 10:15
- Daan De Meyer systemd/mkosi (Meta)

> I'll use these 20 minutes to explain why and why contributing to systemd is a great experience. We'll avoid beating dead horses by not discussing git forges and email, but instead focus on the development experience, from building systemd distribution packages from git main, running integration tests against those distribution packages, debugging failures, writing new tests, and installing the distribution packages on real hardware to debug issues.


### test env 4:30
- duild dir
- container
- vm
- bare metal

### systemd  7:07
- 需要包成 distro packages 才能完整測試
- streamlined systemd dev env
  - container / vm
  - mkosi
- mkosi box: build/lint/analyze/test systemd 10:00

### speed up mkfs to test image 16:41
- btrfs-progs: mkfs: add --reflink option
  ...

### references
- youtube: <https://www.youtube.com/watch?v=IV0AG7lpC4o>
- <https://0pointer.net/blog/a-re-introduction-to-mkosi-a-tool-for-generating-os-images.html>

## ParticleOS: Why is Lennart still not dogfooding systemd?! 
- Day 1 15:20

- problems might just on systemd like: bootloader ...

### references
- <https://github.com/systemd/particleos>
- <https://build.opensuse.org/package/show/system:systemd/particleos-fedora>
- <https://build.opensuse.org/package/show/system:systemd/particleos-debian>


## From initramfs-tools to mkosi-initrd 
- Day 1 5:15

Marco d'Itri (debian)

Marco will review the features available in the initramfs-tools ecosystem, the initrd generator used by Debian and Ubuntu, and how they can be implemented (or not) by adopting mkosi-initrd.

- systemd-networkd vs NetworkManager

### references
- <https://www.youtube.com/watch?v=R_jlWPHEH3Q>
- slide: <https://www.linux.it/~md/text/mkosi-initrd-asg2025.pdf>
