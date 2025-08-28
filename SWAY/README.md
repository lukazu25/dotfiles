## Sway

copy sway folder to sway directory
```bash
sudo cp -r sway ~/.config/sway/
```
 copy waybar config to waybar directory
```bash
sudo cp -r waybar ~/.config/waybar/
```

### Lock on suspend 

To configure **systemd-logind**, edit the file `/etc/systemd/logind.conf`

Set the following options:

```
HandleLidSwitch=suspend
HandleLidSwitchDocked=suspend
```

