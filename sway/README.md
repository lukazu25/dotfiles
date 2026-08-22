# Sway 

copy sway folder to sway directory
```bash
sudo cp -r sway ~/.config/sway/
```
 copy waybar config to waybar directory
```bash
sudo cp -r waybar ~/.config/waybar/
```
copy rofi folder to rofi directory
```bash
sudo cp -r rofi/* ~/.config/rofi/
```
copy wofi folder to wofi directory
```bash
sudo cp -r wofi/* ~/.config/wofi/
```
copy swaync folder to swaync directory
```bash
sudo cp -r swaync/* ~/.config/swaync/
```

### Lock on suspend 

To configure **systemd-logind**, edit the file `/etc/systemd/logind.conf`

Set the following options:

```
HandleLidSwitch=suspend
HandleLidSwitchDocked=suspend
```

