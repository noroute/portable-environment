(require 'req-package)

(req-package flx-ido
  :require (flx key-chord)
  :config (progn (ido-mode 1)
                 (ido-everywhere 1)
                 (flx-ido-mode 1)
                 ;; disable ido faces to see flx highlights.
                 (setq ido-enable-flex-matching t)
                 (setq ido-use-faces nil)
                 (global-set-key (kbd "C-x C-f") 'ido-find-file)
                 (key-chord-define-global "xb" 'ido-switch-buffer)))

(req-package ido-at-point
  :require ido
  :config (ido-at-point-mode 1))

(provide 'init-ido)
