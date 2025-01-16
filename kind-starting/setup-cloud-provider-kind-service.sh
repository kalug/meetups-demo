mkdir -p ~/.config/systemd/user
cp cloud-provider-kind.service ~/.config/systemd/user

systemctl --user shawn status cloud-provider-kind
systemctl --user shawn start cloud-provider-kind

journalctl --user -u cloud-provider-kind -f
