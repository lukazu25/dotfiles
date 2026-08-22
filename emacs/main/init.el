;; -*- lexical-binding: t; -*-

;;; init.el --- Emacs configuration

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

(setq-default indent-tabs-mode nil
              tab-width 4
              display-line-numbers-type 'relative)

(setq inhibit-startup-screen t
      auto-save-default nil
      auto-save-list-file-name nil
      make-backup-files nil
      delete-old-versions t
      create-lockfiles nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(savehist-mode 1)
(recentf-mode 1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (set-face-attribute 'default nil
;;                     :font "JetBrainsMono Nerd Font"
;;                     :height 150
;;                     :weight 'regular)

(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :after marginalia
  :hook (marginalia-mode . nerd-icons-completion-marginalia-setup)
  :config
  (nerd-icons-completion-mode))

(use-package doom-themes
  :config
  (load-theme 'doom-dark+ t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(use-package doom-modeline
  :after nerd-icons
  :init
  (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 25)
  (doom-modeline-bar-width 4)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-buffer-file-name-style 'truncate-upto-project))

(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-cycle t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto nil))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package bookmark
  :ensure nil
  :config
  (setq bookmark-save-flag 1
        bookmark-default-file (locate-user-emacs-file "bookmarks")))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  :custom
  (dashboard-startupify-list '(dashboard-insert-banner                               
                               dashboard-insert-newline
                               dashboard-insert-items
                               dashboard-insert-newline
                               dashboard-insert-init-info))
  (dashboard-projects-backend 'project-el)
  (dashboard-items '((recents . 3)
                     (projects . 3)
                     (agenda . 3)
                     (bookmarks . 3)))
  (dashboard-center-content t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-startup-banner
   (expand-file-name "images/emacs-dash.txt"
                     user-emacs-directory)))

(use-package treesit
  :ensure nil
  :config
  (setq treesit-font-lock-level 4)
  (setq major-mode-remap-alist
        '((c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode))))

(use-package eglot
  :ensure nil
  :hook ((c-mode . eglot-ensure)
         (c-ts-mode . eglot-ensure)
         (c++-mode . eglot-ensure)
         (c++-ts-mode . eglot-ensure))
  :custom
  (eglot-autoshutdown t)
  (eglot-confirm-server-initiated-edits nil))

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook ((prog-mode . rainbow-mode)
         (org-mode . rainbow-mode)))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)

;;; init.el ends here
