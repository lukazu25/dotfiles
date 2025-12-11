# Qtile 

If you use a display manager
```bash
sudo cp qtile.desktop /usr/share/xsessions/
```
If you don't
```bash
echo "exec qtile start >> ~/.xinitrc
```
dunst config 
```bash
sudo cp dunstrc ~/.config/dunst/
```
copy config to qtile directory
```bash
sudo cp config.py ~/.config/qtile/
```
copy colors to qtile directory
```bash
sudo cp colors.py ~/.config/qtile/
```
copy autostart to qtile directory
```bash
sudo cp autostart.sh ~/.config/qtile/
```
 make it executable 
```bash
sudo chmod +x autostart.sh
```
