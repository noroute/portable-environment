(require 'req-package)

(req-package json-reformat
  :commands json-reformat-region
  :init (progn (setq json-reformat:indent-width 2)
               (setq json-reformat:pretty-string? t)))

(req-package json-mode
  :mode ("\\.json$" . json-mode)
  :init (req-package-hooks-add-execute 'json-mode
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2))))

(provide 'init-json)
