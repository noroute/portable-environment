(require 'package)

(defconst my-custom-file "~/.emacs.d/custom.el")

(setq custom-file my-custom-file)
(setq package-enable-at-startup nil)
(load my-custom-file t)
	(setq make-backup-files nil)
(put 'erase-buffer 'disabled nil)

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/init-real.el")))
