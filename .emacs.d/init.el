(setq custom-file "~/.emacs.d/custom.el")
(load-file "~/.emacs.d/custom.el") 
(load-file "~/.emacs.d/org-mode.el")
(load-file "~/.emacs.d/voidlight-theme.el")

(setq inhibit-startup-screen t) ;; fancy stuff
(global-visual-line-mode t)
(global-display-line-numbers-mode)
(show-paren-mode t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1) ;; numbers
(electric-pair-mode 1)
(recentf-mode 1)

;; backups 
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(load-theme 'voidlight t)

(setq-default tab-width 4)
(setq-default indent-tabs-mode 4)
(setq-default c-basic-offset 4)
;;(add-hook 'prog-mode-hook 'enable-tabs)

;; packages
(require 'package) ;;emacs' package manager 
(setq package-archives
	  '(("melpa" . "https://melpa.org/packages/")
 	   ("nongnu" . "https://elpa.nongnu.org/nongnu/")
	   ("elpa" . "https://elpa.gnu.org/packages/"))
	  package-archives-priorities
	  '(("melpa" . 8)
		("nongnu" . 10)
		("elpa" . 4)))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; rust stuff
(require 'rust-mode)
(defun sp1ff/rust/mode-hook ()
 "My rust-mode hook"
 ;; Style per the Rust Style Guide:
 ;; <https://github.com/rust-lang-nursery/fmt-rfcs/blob/master/guide/guide.md>
 (setq indent-tabs-mode nil
       tab-width 4
       c-basic-offset 4
       fill-column 100))

(use-package rust-mode
  :ensure t
  :hook (rust-mode . sp1ff/rust/mode-hook)
  :config
  (let ((dot-cargo-bin (expand-file-name "~/.cargo/bin")))
    (setq rust-rustfmt-bin (concat dot-cargo-bin "rustfmt")
          rust-cargo-bin (concat dot-cargo-bin "cargo")
          rust-format-on-save t)))

;; evil mode
(setq evil-want-keybinding nil)
(require 'evil)
(evil-mode 1)
;; (evil-set-initial-state 'dired-mode 'emacs)
;; magit
(use-package magit
  :ensure t)
(use-package evil-collection 
  :ensure t
  :after evil
  :init
  (evil-collection-init))

;; dired
(use-package dired-open
  :config
  (setq dired-open-extensions '(
								("pdf" . "zathura")
								("mkv" . "mpv"))))
(evil-define-key 'normal dired-mode-map "gu" 'revert-buffer)
;;(use-package typst-ts-mode
;;  :elpaca (:type git :host sourcehut :repo "meow_king/typst-ts-mode")
;;  :custom
;;  (typst-ts-mode-watch-options "--open"))
