## isd: interactive systemd

Kai Norman Clasen (NixOS / python)

Simplify systemd management with isd! isd is a TUI offering fuzzy search for units, auto-refreshing previews, smart sudo handling, and a fully customizable interface for power-users and newcomers alike.

If you ever became frustrated while typing:

systemctl start --user unit-A.service (manually starting a unit)
systemctl status --user unit-A.service (seeing that it failed)
journalctl -xe --user -u unit-A.service (checking the logs)
systemctl edit --user unit-A.service (updating the unit)
(repeat until problem is solved)
isd could help.

In this presentation, we will discuss the features that isd currently supports, the features that are planned for the future, and the experience of developing a TUI for systemd commands.

- <https://www.youtube.com/watch?v=pjyT2lwYa-s>
- <https://github.com/kainctl/isd/tree/slides/docs/slides>

## Slim device software with systemd targets and nspawn

Axis

Umut Tezduyar Lindskog
Fredrik Hugosson
Software Architect for Body Worn Camera Solutions

- https://www.youtube.com/watch?v=1lcKO_DJnDc
