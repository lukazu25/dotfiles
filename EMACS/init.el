;;; init.el --- Emacs configuration with use-package

;; Set up package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; Install use-package if not present
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

;; General settings
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq make-backup-files nil)
(setq delete-old-versions -1)
(setq create-lockfiles nil)  
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Font configuration (JetBrains Mono)
(set-face-attribute 'default nil
                    :font "JetBrains Mono"
                    :height 120
                    :weight 'regular)

;; All-the-icons for icon support
(use-package all-the-icons
  :if (display-graphic-p)
  :config
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

;; Dired icons
(use-package all-the-icons-dired
  :after (all-the-icons dired)
  :hook (dired-mode . all-the-icons-dired-mode)
  :custom
  (all-the-icons-dired-monochrome nil)) ;; Set to t for monochrome icons

;; Add icons to minibuffer using all-the-icons-completion
(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))

;; Theme (Doom)
(use-package doom-themes
  :config
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; Doom modeline
(use-package doom-modeline
  :after all-the-icons
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 4)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))

;; Vertico (minimal completion system)
(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-cycle t))

;; Corfu (completion at point)
(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 2))

;; Marginalia (rich annotations in minibuffer)
(use-package marginalia
  :init
  (marginalia-mode))

;; Embark (contextual actions)
(use-package embark
  :bind
  (("C-." . embark-act)
   ("M-." . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

;; Consult (enhanced search and navigation)
(use-package consult
  :bind
  (("C-c s" . consult-line)
   ("C-x b" . consult-buffer)
   ("M-y" . consult-yank-pop)
   ("M-g g" . consult-goto-line))
  :config
  (consult-customize
   consult-buffer :preview-key 'any))

;; Embark-Consult integration
(use-package embark-consult
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Projectile (project management)
(use-package projectile
  :init
  (projectile-mode +1)
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-project-search-path '("~/projects/"))
  (projectile-switch-project-action #'projectile-dired))

;; Dashboard (startup screen)
(use-package dashboard
  :after projectile
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-projects-backend 'projectile)
  (dashboard-items '((recents  . 5)
                     (projects . 5)
                     (bookmarks . 5)))
  (dashboard-center-content t)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-startup-banner 'logo)
  (dashboard-banner-logo-title "Welcome to Emacs!")
  (dashboard-startup-banner "/home/vm/.config/emacs/images/emacs-dash.png"))

;; Save customizations to a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
