# IPC

varlink examples: https://www.freedesktop.org/software/systemd/man/255/varlinkctl.html

```
$ varlinkctl info /run/systemd/resolve/io.systemd.Resolve

    Vendor: The systemd Project
   Product: systemd (systemd-resolved)
   Version: 254 (254-1522-g4790521^)
       URL: https://systemd.io/
Interfaces: io.systemd
            io.systemd.Resolve
            org.varlink.service
```

```
$ varlinkctl list-interfaces /run/systemd/resolve/io.systemd.Resolve

io.systemd
io.systemd.Resolve
org.varlink.service
```

```
$ varlinkctl introspect /run/systemd/resolve/io.systemd.Resolve io.systemd.Resolve

# Describes the update flag for browsing services, indicating whether a service was added or removed during browsing.
type BrowseServiceUpdateFlag(
        # Indicates that the service was added.
        added,
        # Indicates that the service was removed.
        removed
)
...
```

```
varlinkctl call /run/systemd/resolve/io.systemd.Resolve io.systemd.Resolve.ResolveHostname '{"name":"systemd.io","family":2}' -j

```

## Linux IPC: Lost between Threading and Networking
Day 1 11:25
David Rheinsberg (RHEL, BUS1, Wayland, systemd, and kdbus)

- From Cold Boot to Browser
- Encoding Matter
- Windows / macOS / iOS / Mach Ports / Solaris Doors / Android binder

- <https://www.youtube.com/watch?v=DVdkSBn7hH0>

## How I optimized away 94% CPU from zbus
Day 1 11:55
Zeeshan Ali Khan zbus / zlink (rust)

- Senior Embedded Engineer at JUCR GmbH (now a part of eze.network GmbH) from May 2024 to April 2025. My team was responsible for all the software that powered the JUCR charging stations. All the code is written in Rust and involves a mix of Embedded Linux and baremetal development. We relied on frameworks like tokio and embassy.
- Rust & FOSS specialist consultant at Mercedes-Benz Vans in the Digital Upfitter project on a 1 year contract from Dec 2022 to Dec 2023. My work included:

- <https://www.youtube.com/watch?v=zMlGicvZNGY>

## Forget zbus, zlink is the future of IPC in Rust
Day 2 14:05
Zeeshan Ali Khan zbus / zlink


- <https://www.youtube.com/watch?v=CHgzWbvl9eE>

## Accessing shadow records via varlink 
Day 1 12:25

Thorsten Kukuk (Suse)

systemctl status systemd-userdbd
userdbctl

- <https://www.youtube.com/watch?v=CHgzWbvl9eE>
- <https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/RUTE9Y/resources/ASG2025-pwaccess_E4ZajV4.pdf>

