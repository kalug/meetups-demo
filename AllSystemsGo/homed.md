# Dirlock: a new tool to manage encrypted filesystems 

In the Linux world there are several tools and technologies to encrypt data on a hard drive, most falling into one of two categories: block device encryption (like LUKS) or stacked filesystem encryption (like EncFs or gocryptfs). This presentation will introduce Dirlock, a new tool that belongs to a third category: native filesystem encryption, using the kernel's fscrypt API. Dirlock is currently being developed and its aim is to provide a flexible way to encrypt files, suitable for both user accounts and arbitrary directories, with full PAM integration, support for hardware-backed mechanisms such as FIDO2 or TPM and with a D-Bus API for easy management.

Day 2 14:50

Alberto Garcia SteamOS


- <https://gitlab.steamos.cloud/holo/dirlock/> (rust)
- <https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/AAWNQT/resources/dirlock-all-systems-go_4QwS0F3.pdf>
