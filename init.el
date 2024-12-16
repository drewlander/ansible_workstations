(tool-bar-mode -1)
(menu-bar-mode -1) 
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "https://orgmode.org/elpa/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(use-package page-break-lines :ensure t)
(use-package projectile :ensure t)
(use-package all-the-icons :ensure t)
(use-package nerd-icons :ensure t)
(use-package helm :ensure t)
(use-package company :ensure t)
(use-package lsp-mode :ensure t)
(use-package projectile :ensure t)
(use-package neotree :ensure t)
(use-package magit :ensure t)
(use-package rg :ensure t)
(use-package markdown-mode :ensure t)
(use-package cyberpunk-theme :ensure t)

;; use-package with package.el:
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(emms cyberpunk-theme rg magit neotree lsp-mode company markdown-mode projectile page-break-lines nerd-icons dashboard all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'cyberpunk t)
(add-hook 'mpc-mode-hook
 (lambda ()
   (keymap-local-set "M-p"        'windmove-up)
   (keymap-local-set "M-n"        'windmove-down)
   (keymap-local-set "M-b"        'windmove-left)
   (keymap-local-set "M-f"        'windmove-right)
   (keymap-local-set "C-<return>" 'mpc-play-at-point)
   (keymap-local-set "<SPC>"      'mpc-toggle-play)
   (keymap-local-set "s"          'mpc-toggle-shuffle)
   (keymap-local-set "n"          'next-line)
   (keymap-local-set "p"          'previous-line)
   (keymap-local-set "f"          'mpc-next)
   (keymap-local-set "b"          'mpc-prev)))
(emms-all)
(setq emms-player-list '(emms-player-vlc)
      emms-info-functions '(emms-info-native))

