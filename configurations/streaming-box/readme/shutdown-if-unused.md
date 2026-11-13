# Setting up shutdown-if-unused
### Shut down the device if no input action occurs within the first 5 minutes since boot.

- Install `libinput-utils`
- Create `/usr/local/sbin/shutdown-if-unsed`
- `sudo chmod 755 /ser/local/sbin/shutdown-if-unsued`
- Create `/etc/systemd/system/shutdown-if-unused.service`
- `sudo systemctl daemon-reload` 
- `sudo systemctl enable shutdown-if-unused.service`