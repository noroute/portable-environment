;;; noroute-editing.el -- editing goodness
(require 'req-package)

;; Multiple cursors!
(req-package 'multiple-cursors
  :config (progn (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
                 (global-set-key (kbd "C->") 'mc/mark-next-like-this)
                 (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
                 (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)))

;; Visual regexp
(req-package 'visual-regexp
  :config (progn (global-set-key (kbd "C-c m") 'vr/mc-mark)))

(provide 'noroute-editing)
;;; editing.el ends here
