# NixOS

copy nix files to nixos directory

```bash
sudo cp -r NIXOS/* /etc/nixos
```

rebuild the system

```bash
sudo nixos-rebuild switch --flake /etc/nixos
```
