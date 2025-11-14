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
