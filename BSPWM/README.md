copy bspwm config to bspwm directory
```bash
sudo cp bspwmrc ~/.config/bspwm/
```
 copy polybar config to polybar directory
```bash
sudo cp config.ini ~/.config/polybar/
```
copy sxhkdrc config to sxhkd directory
```bash
sudo cp sxhdrc ~/.config/sxhkd/
```
copy launch script to polybar directory
```bash
sudo cp launch.sh ~/.config/polybar/
```

copy launch volume and brightness script to bspwm directory
```bash
sudo cp volume.sh ~/.config/bspwm/scripts/
sudo cp brightness.sh ~/.config/bspwm/scripts/
```

copy picom to picom directory
```bash
sudo cp picom.conf ~/.config/picom/
```

make it executable
```bash
sudo chmod +x launch.sh
sudo chmod +x bspwmrc
sudo chmod +x volume.sh
sudo chmod +x brightness.sh
```
