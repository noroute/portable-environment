(require 'req-package)

(req-package dired
  :commands dired
  :require (key-chord autorevert diff-hl)
  :config (progn (define-key dired-mode-map (kbd "M-i") 'helm-swoop)
				 (define-key dired-mode-map (kbd "M-RET") 'dired-find-file-other-window)
				 (key-chord-define dired-mode-map "qq" 'dired-up-directory)
				 (req-package-hooks-add-execute 'dired-mode (lambda () (auto-revert-mode 1)))
				 (req-package-hooks-add-execute 'dired-mode (lambda () (diff-hl-dired-mode 1)))))

(req-package sunrise-commander :commands sunrise-cd)
(req-package sunrise-x-loop :require sunrise-commander)
(req-package dired-rainbow :require dired)
(req-package dired-open :require dired)

(provide 'init-dired)
