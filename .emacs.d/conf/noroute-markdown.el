;;; noroute-markdown.el -- Markdown setup
(require 'req-package)

(req-package 'markdown-mode
  :config (progn (add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
                 (add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))))

(provide 'noroute-markdown)
