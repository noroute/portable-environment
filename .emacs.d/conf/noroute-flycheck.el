;;; noroute-flycheck.el --- Flycheck setup
(require 'req-package)

(req-package 'flycheck-color-mode-line)

(req-package 'flycheck
  :require (flycheck-color-mode-line)
  :config (progn (add-hook 'find-file-hook
          (lambda ()
            (when (not (equal 'emacs-lisp-mode major-mode))
              (flycheck-mode))))
                 (global-set-key (kbd "M-n") 'next-error)
                 (global-set-key (kbd "M-p") 'previous-error)
                 (package-require 'flycheck-color-mode-line)
                 (eval-after-load "flycheck"
                   '(progn
                      (setq flycheck-highlighting-mode nil)
                      (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
                      ))))

(provide 'noroute-flycheck)
