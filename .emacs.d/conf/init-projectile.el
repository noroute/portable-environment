(require 'req-package)

(req-package projectile
  :require (ido-flx)
  :config (progn (projectile-global-mode)
		 (setq projectile-completion-system 'ido)
		 (global-set-key (kbd "s-p") 'projectile-command-map)))

(provide 'init-projectile)
