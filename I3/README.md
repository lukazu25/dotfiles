copy i3 config to i3 directory
```bash
sudo cp config ~/.config/i3/
```
 copy polybar config to polybar directory
```bash
sudo cp config.ini ~/.config/polybar/
```

copy i3status config to i3status directory
```bash
sudo cp config ~/.config/i3status/
```

if you want use i3blocks instead of polybar and i3status copy i3blocks config to i3blocks directory
```bash
sudo cp config ~/.config/i3blocks/
```

copy launch script to polybar directory
```bash
sudo cp launch_polybar.sh ~/.config/polybar/
```

copy volume and brightness scripts to i3 directory
```bash
sudo volume.sh config ~/.config/i3/scripts/
sudo brightness.sh config ~/.config/i3/scripts/
```

copy picom config to picom directory
```bash
sudo cp picom.conf ~/.config/picom/
```

make scripts executable
```bash
sudo chmod +x launc_polybar.sh
sudo chmod +x brightness.sh
sudo chmod +x volume.sh
```


