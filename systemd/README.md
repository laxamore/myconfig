# My User Systemd Services

### List service

- <strong>rclone-gdrive</strong>
  <dt>for google drive mount</dt>

### Enabling the service

```bash
# reloading daemon for changes
systemctl --user daemon-reload

# enable it and started after reboot
systemctl --user enable replaceHereWithService

# run it without reboot
systemctl --user start replaceHereWithService
```
