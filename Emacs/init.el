;;; init.el --- Emacs configuration 

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
;;(set-face-attribute 'default nil
;;                    :font "JetBrains Mono"
;;                    :height 120
;;                    :weight 'regular)

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
  (load-theme 'doom-dark+ t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

;; Doom modeline
;;(use-package doom-modeline
;;  :after all-the-icons
;;  :init
;;  (doom-modeline-mode 1)
;;  :custom
;;  (doom-modeline-height 25)
;; (doom-modeline-bar-width 4)
;;  (doom-modeline-icon t)
;; (doom-modeline-major-mode-icon t)
;;  (doom-modeline-buffer-file-name-style 'truncate-upto-project))

;; Vertico (minimal completion system)
(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-cycle t))

;; Orderless (flexible completion style)
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion)))))
  :config
  (setq orderless-component-separator #'orderless-escapable-split-on-space))

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

;; Make Org-mode look good
(use-package org-modern
  :hook ((org-mode . org-modern-mode)
         (org-agenda-finalize-hook . org-modern-agenda))
  :config
  (global-org-modern-mode))


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
  (dashboard-startup-banner "~/.config/emacs/images/emacs-dash.png"))

;; LSP Client
(use-package eglot
  :hook ((sh-mode . eglot-ensure)
         (c-mode . eglot-ensure)
         (c++-mode . eglot-ensure))
   :config
  (add-to-list 'eglot-server-programs '((sh-mode) . ("bash-language-server" "start")))
  (add-to-list 'eglot-server-programs '((c-mode c++-mode) . ("clangd")))
  
  (setq eglot-autoshutdown t
        eglot-confirm-server-initiated-edits nil))

(use-package sh-script
  :ensure nil  ; Built into Emacs
  :mode (("\\.sh\\'" . sh-mode)
         ("\\.bash\\'" . sh-mode)
         ("\\.bashrc\\'" . sh-mode)
         ("\\.bash_profile\\'" . sh-mode)
         ("\\.bash_aliases\\'" . sh-mode)
         ("\\.zsh\\'" . sh-mode)
         ("\\.zshrc\\'" . sh-mode))
  :config
  (setq sh-basic-offset 2
        sh-indentation 2))

(use-package c-mode
  :ensure nil  
  :mode (("\\.c\\'" . c-mode)
         ("\\.h\\'" . c-mode)))

(use-package cc-mode
  :ensure nil 
  :mode (("\\.cpp\\'" . c++-mode)
         ("\\.cxx\\'" . c++-mode)
         ("\\.c++\\'" . c++-mode)
         ("\\.cc\\'" . c++-mode)
         ("\\.hpp\\'" . c++-mode)
         ("\\.hxx\\'" . c++-mode)
         ("\\.h++\\'" . c++-mode)
         ("\\.hh\\'" . c++-mode)))


;; Save customizations to a separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
