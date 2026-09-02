;; -*- lexical-binding: t; -*-
(use-package org
  :config
  (unbind-key "S-<left>" org-mode-map)
  (unbind-key "S-<right>" org-mode-map)
  (unbind-key "S-<up>" org-mode-map)
  (unbind-key "S-<down>" org-mode-map)
  (unbind-key "C-S"))

(setq org-agenda-files '("~/org/")) ;; similar to vaults
(setq org-log-done 'time)
;; associating all org files with org mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) 
(add-hook 'org-mode-hook 'org-indent-mode)

(use-package org-roam
  :init
  :custom
  (org-roam-directory "~/org/")
  (org-roam-completion-everywhere t))

(use-package websocket
  :after org-roam)

(use-package org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
		org-roam-ui-follow t
		org-roam-ui-update-on-save t
		org-roam-ui-open-on-start t))
