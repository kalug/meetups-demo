## CentOS Proposed Updates: Bridging the Gap between development and production

Meta

Hyperscale

https://www.youtube.com/watch?v=r8FWdGweVrc
https://www.centos.org/sigs/

## OS as a Service at Meta Platforms


Serge Dubrouski (Meta)

I overview how OS management is done at Meta. We run millions of Linux servers and we have to make sure that OS gets updated on all of them in a given period of time. To do that we developed several products: MetalOS (Image based version of CentOS), Antlir (image builder) and Rolling OS Update (a service that keeps a set of DNF repos in sync with upstream repos and uses them to update OS )

- https://cfp.all-systems-go.io/media/all-systems-go-2025/submissions/VNCDRL/resources/All_Systems_Go_2025_OS_As_a_Service_at__Z35OZbA.pdf


## A terminal for operating clouds: administering S3NS with image-based NixOS

## GNOME OS' prêt-à-booter image

GNOME OS is a distribution based around systemd-sysupdate. This year, we finally created a live installer image using the same /usr partition as the installed OS. The main innovation however is the ability to install without the need to reboot. The user can start working while the installation is happening.

This live image is built using systemd-repart. And the installer itself also uses systemd-repart. But systemd-repart is not the complete solution and we had to solve some challenges.



