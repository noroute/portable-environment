;;; noroute-editing.el -- editing goodness

;; Multiple cursors!
(package-require 'multiple-cursors)
(global-set-key (kbd "S-<insert>") 'mc/edit-lines)
(global-set-key (kbd "C-<print>") 'mc/mark-previous-like-this)
(global-set-key (kbd "<insert>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-<insert>") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-<insert>") 'mc/mark-all-like-this-dwim)

;; Visual regexp
(package-require 'visual-regexp)
;(global-set-key (kbd "C-c r") 'vr/replace)
(global-set-key (kbd "C-c q") 'vr/query-replace)
(global-set-key (kbd "C-c m") 'vr/mc-mark)

(provide 'noroute-editing)
;;; editing.el ends here
