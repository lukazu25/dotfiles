# MangoWC

# Installation Guide 

## Arch Linux

For Arch Linux, installation is straightforward using the AUR:

```
yay -S mangowc-git
```

Then install the required dependencies:

```
sudo pacman -Sy kitty wl-clipboard rofi grim slurp swaybg firefox ttf-jetbrains-mono-nerd
```

## NixOS

For NixOS, you'll need to add MangoWC as a flake input to your configuration.
First, add the flake input to your `flake.nix`

```
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    mangowc = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, mangowc, ... }: {
    nixosConfigurations.yourHostname = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        mangowc.nixosModules.default
      ];
    };
  };
}
```

Then enable MangoWC in your `configuration.nix`

```
{ config, pkgs, ... }:

{
  programs.mangowc.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    rofi
    wl-clipboard
    grim
    slurp
    swaybg
    firefox
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
```

Rebuild your system:

```
sudo nixos-rebuild switch --flake .#your_hostname
```

## Gentoo

For Gentoo users, you'll need to add MangoWC via an overlay or manually compile it.

The package is in the community-maintained repository called GURU.
First, add GURU repository:

```
emerge --ask --verbose eselect-repository
eselect repository enable guru
emerge --sync guru
```

Then, add `gui-libs/scenefx` and `gui-wm/mangowc` to the `package.accept_keywords`.

Finally, install the package:

```
emerge --ask --verbose gui-wm/mangowc
```

If you want to manually compile it 

First, install the dependencies:

```
sudo emerge --ask \
  dev-libs/wayland \
  dev-libs/wayland-protocols \
  gui-libs/wlroots \
  dev-libs/libinput \
  x11-libs/libdrm \
  x11-libs/libxkbcommon \
  x11-libs/pixman \
  dev-util/meson \
  dev-util/ninja \
  sys-apps/hwdata \
  sys-auth/seatd \
  dev-libs/libpcre2 \
  x11-terms/kitty \
  x11-misc/rofi \
  gui-apps/wl-clipboard \
  gui-apps/grim \
  gui-apps/slurp \
  gui-apps/swaybg \
  www-client/firefox \
  media-fonts/jetbrains-mono
```

Then clone and build MangoWC from source:

```
git clone https://github.com/DreamMaoMao/mangowc
cd mangowc
meson setup build
ninja -C build
sudo ninja -C build install
```
## To use my config 

copy mango config to mango directory
```bash
sudo cp config.conf ~/.config/mango/
```
copy autostart to mango directory
```bash
sudo cp autostart.sh ~/.config/waybar/
```
copy waybar configs to waybar directory
```bash
sudo cp config ~/.config/waybar/
```
copy waybar configs to waybar directory
```bash
sudo cp style.css ~/.config/waybar/
```


