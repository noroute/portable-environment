;;; noroute-markdown.el -- Markdown setup
(package-require 'markdown-mode)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'noroute-markdown)
