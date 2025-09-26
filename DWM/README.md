## DWM 


```bash
sudo cp startdwm.sh /usr/local/bin/
```

If you use a display manager
```bash
sudo cp dwm.desktop /usr/share/xsessions/

```
If you don't
```bash
echo "exec /usr/local/bin/startdwm.sh" >> ~/.xinitrc
```
### Lock on suspend 

Create the following service which locks the screen

`/etc/systemd/system/slock@.service`

```
[Unit]
Description=Lock X session using slock for user %i
Before=sleep.target

[Service]
User=%i
Environment=DISPLAY=:0
ExecStart=/usr/local/bin/slock

[Install]
WantedBy=sleep.target
```
Enable the `slock@user.service` systemd unit for it to take effect for the username user

```
sudo systemctl enable slock@username.service
```
