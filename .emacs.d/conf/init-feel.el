(require 'req-package)

(setq-default bookmark-save-flag 1)

(setq use-dialog-box nil)
(setq enable-local-variables nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(req-package recentf
  :config (recentf-mode 1))

(req-package zygospore
  :require key-chord
  :commands zygospore-toggle-delete-other-windows
  :init (key-chord-define-global ";1" 'zygospore-toggle-delete-other-windows))

(req-package multifiles
  :bind ("C-!" . mf/mirror-region-in-multifile))

(req-package-hooks-add-execute 'before-save 'delete-trailing-whitespace)

(req-package savekill
  :config (progn (setq savekill-max-saved-items nil)
                 (load save-kill-file-name t)))

(req-package smex
  :require key-chord
  :bind ("M-x" . smex)
  :config (smex-initialize))

(req-package string-edit
  :config (global-set-key (kbd "C-c e") 'string-edit-at-point))

(req-package paradox
  :require key-chord
  :commands paradox-list-packages
  :init (key-chord-define-global ";p" 'paradox-list-packages))

(req-package savehist
  :config (savehist-mode 1))

(req-package duplicate-thing
  :config (progn (global-set-key (kbd "C-c d") 'duplicate-thing)))

(req-package expand-region
  :require key-chord
  :init (key-chord-define-global "xx" 'er/expand-region)
  :bind ("C-=" . er/expand-region))

(req-package rotate
  :config
  (global-set-key (kbd "s-r") 'rotate-layout))
