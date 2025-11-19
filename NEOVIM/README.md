# NeoVim 

# Compile From Source

## Prerequisites

Ensure you have the following tools installed:

- `git`
- `cmake`
- `ninja` (or `make`)
- `gcc` or `clang`
- `pkg-config`
- Development libraries: `libtool`, `libuv`, `libvterm`, `msgpack`, `libtree-sitter`, `luajit`, etc.

## Clone the Repo

```
git clone https://github.com/neovim/neovim.git
cd neovim
```
Optional: switch to a specific release or branch:

```
git checkout stable    # or nightly, or a specific tag like v0.9.5
```

## Build and Install

```
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```
This installs Neovim to `/usr/local/bin/nvim` by default.

## Verify Installation

```
nvim --version
```

## Update Neovim

Navigate to the Neovim directory

```
cd /path/to/neovim
```
Check out the stable branch 

```
git checkout stable
```

Pull the latest changes

```
git pull origin stable
```

Rebuild Neovim

```
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

## To use my config

```
sudo cp -r NEOVIM/DEFAULT/* ~/.config/nvim/
``` 

## To use my minimal config

```
sudo cp NEOVIM/MINIMAL/init.lua ~/.config/nvim/
``` 

