;;; noroute-editing.el -- editing goodness
(require 'req-package)

;; Multiple cursors!
(req-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)))

;; Visual regexp
(req-package visual-regexp
  :bind ("C-c m" . vr/mc-mark))

(provide 'init-editing)
;;; editing.el ends here
