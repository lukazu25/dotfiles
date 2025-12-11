# Emacs

# Compile From Source

## Prerequisites

Ensure you have the following tools installed:

- `make`
- `gcc` or `clang`
- `libc6-dev`
- `texinfo`
- Development libraries: `libgccjit-dev`, `libgnutls-dev`, `libxml2-dev`, `libncurses5-dev`, `libjansson-dev`, `libgtk3.0-dev`, `libx11-dev`, `libxpm-dev`, `libjpeg-dev`, `libpng-dev`, `libgif-dev`, `libtiff-dev`, `libtree-sitter-dev`, `imagemagick-dev`, `libcairo-dev`, `libmailutils-dev`.

## Downloading emacs Source-Code

```
wget -c https://ftpmirror.gnu.org/pub/gnu/emacs/emacs-VERSION.tar.xz
tar -axvf emacs-VERSION.tar.xz
cd emacs-VERSION
```
(Replace ‘VERSION’ with the relevant version number, e.g., ‘28.1’.)


## Configure the Build

The `./configure` script prepares the source code for compilation based on your system and desired features. This is the most critical step for customization.

You should also specify an installation location, typically `/usr/local`, using `--prefix`.

**Basic Configuration (Recommended):**

```
./configure \
    --prefix=/usr/local \
    --with-native-compilation \
    --with-tree-sitter \
    --with-json \
    --with-x-toolkit=gtk3 \
    --with-imagemagick \
    --with-gnutls \
    --with-pgtk \
    --with-mailutils
```

Note: The exact flags and necessary development libraries may vary based on your distribution and version. Use `./configure --help` to see all available options.

## Compile the Source

Once configuration is complete, compile Emacs using `make`. You can speed up the process by using multiple processor cores (e.g., using `$(nproc)` or the number of cores on your system with the `-j` flag).

```
make -j$(nproc)
```

## Install Emacs

After a successful compilation, install the Emacs binary and runtime files to the directory specified by `--prefix` (usually `/usr/local`). This step requires root privileges.

```
sudo make install
```

## Verification

To confirm that your new version of Emacs is installed and includes the features you selected, run the following command:

```
emacs --version
```

## Cleaning Up (Optional)

You can remove the compiled object files and temporary data from the source directory, although it is not strictly necessary.

```
make clean
```

If you installed Emacs to a custom location, you may need to update your system's `PATH` environment variable to ensure the new Emacs binary is found before any old versions. The new binary will typically be located at `/usr/local/bin/emacs`.

## Update Emacs

Navigate to the Emacs directory

```
cd /path/to/emacs
```

Download the New Source

```
wget -c https://ftpmirror.gnu.org/pub/gnu/emacs/emacs-NEW_VERSION.tar.xz
tar -xJvf emacs-NEW_VERSION.tar.xz
cd emacs-NEW_VERSION
```

## Re-Configure the Build

```
./configure \
    --prefix=/usr/local \
    --with-native-compilation \
    --with-tree-sitter \
    --with-json \
    --with-x-toolkit=gtk3 \
    --with-imagemagick \
    --with-gnutls \
    --with-pgtk \
    --with-mailutils
```

## Re-Compile and Install

The `make` and sudo `make install` commands will overwrite the old Emacs files with the newly compiled binaries.

- **Compile**

```
make -j$(nproc)
```

- **Install (requires root privileges)**

```
sudo make install
```

## Verification

Check the Version and Features:

```
emacs --version
```

## Cleaning Up (Optional)

- **Clean Object Files**

```
make clean
```

# EXWM (Emacs X Window Manager)

# Installation Guide

1. Install EXWM from MELPA:

   In the minibuffer, type the following command::
  ```
  M-x package-install RET exwm RET
  ```
2. Add following lines to your `init.el`:
  ```
(require 'exwm)
;; Set the initial workspace number.
(setq exwm-workspace-number 4)
;; Make class name the buffer name.
(add-hook 'exwm-update-class-hook
  (lambda () (exwm-workspace-rename-buffer exwm-class-name)))
;; Global keybindings.
(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset) ;; s-r: Reset (to line-mode).
        ([?\s-w] . exwm-workspace-switch) ;; s-w: Switch workspace.
        ([?\s-&] . (lambda (cmd) ;; s-&: Launch application.
                     (interactive (list (read-shell-command "$ ")))
                     (start-process-shell-command cmd nil cmd)))
        ;; s-N: Switch to certain workspace.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))
;; Enable EXWM
(exwm-wm-mode)
  ```
3. Add following lines to `~/.xinitrc`:
  ```
  # Disable access control for the current user.
xhost +SI:localuser:$USER

# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

# Set default cursor.
xsetroot -cursor_name left_ptr

# Set keyboard repeat rate.
xset r rate 200 60

# Uncomment the following block to use the exwm-xim module.
#export XMODIFIERS=@im=exwm-xim
#export GTK_IM_MODULE=xim
#export QT_IM_MODULE=xim
#export CLUTTER_IM_MODULE=xim

# Finally start Emacs
exec emacs
  ```
4. If you use display manager create file `/usr/share/xsessions/emacs.desktop` and add following lines :
  ```
[Desktop Entry]
Name=Emacs
Exec=emacs
Type=Application
  ```

## To use my config

```
sudo cp -r EMACS/* ~/.config/emacs/
``` 
