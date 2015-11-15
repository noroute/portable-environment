;;; noroute-markdown.el -- Markdown setup
(require 'req-package)

(req-package markdown-mode
  :mode ("\\.md$" "\\.markdown$"))

(provide 'init-markdown)
