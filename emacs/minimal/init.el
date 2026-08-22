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
              tab-width 4)
              
(setq auto-save-default nil
      auto-save-list-file-name nil
      make-backup-files nil
      delete-old-versions t
      create-lockfiles nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(savehist-mode 1)
(recentf-mode 1)
(fido-mode 1)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#d3b58d" :background "#041818"))))
 '(custom-group-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(custom-variable-tag-face ((t (:underline t :foreground "lightblue"))) t)
 '(font-lock-builtin-face ((t nil)))
 ; '(font-lock-comment-face ((t (:foreground "yellow"))))
 '(font-lock-comment-face ((t (:foreground "#3fdflf"))))
 '(font-lock-function-name-face ((((class color) (background dark)) (:foreground "white")))) 
 '(font-lock-keyword-face ((t (:foreground "white" ))))
 ; '(font-lock-string-face ((t (:foreground "gray160" :background "gray16"))))
 '(font-lock-string-face ((t (:foreground "#0fdfaf"))))
 '(font-lock-variable-name-face ((((class color) (background dark)) (:foreground "#c8d4ec"))))  
; '(font-lock-warning-face ((t (:foreground "#695a46"))))
 '(font-lock-warning-face ((t (:foreground "#504038"))))
 '(highlight ((t (:foreground "navyblue" :background "darkseagreen2"))))
 '(mode-line ((t (:inverse-video t))))
 '(region ((t (:background "blue"))))
 '(widget-field-face ((t (:foreground "white"))) t)
 '(widget-single-line-field-face ((t (:background "darkgray"))) t))
 
(set-cursor-color "lightgreen")
(set-background-color "#072626")
(set-face-foreground 'font-lock-builtin-face         "lightgreen")

;; (set-face-attribute 'default nil
;;                     :font "JetBrainsMono Nerd Font"
;;                     :height 150
;;                     :weight 'regular)

;; (setq-default mode-line-format
;;               '("%e" "  "
;;                 (:propertize
;;                  ("" mode-line-mule-info mode-line-client mode-line-modified mode-line-remote))
;;                 mode-line-frame-identification
;;                 mode-line-buffer-identification
;;                 "   "
;;                 mode-line-position
;;                 mode-line-format-right-align
;;                 "  "
;;                 (project-mode-line project-mode-line-format)
;;                 " "
;;                 (vc-mode vc-mode)
;;                 "  "
;;                 mode-line-modes
;;                 mode-line-misc-info
;;                 "  ")
;;               project-mode-line t
;;               mode-line-buffer-identification '(" %b")
;;               mode-line-position-column-line-format '(" %l:%c"))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'noerror 'nomessage)

;;; init.el ends here
