; Automatic encryption with EasyPG
(require 'epa-file)
(epa-file-enable)

(require 'tex-site)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/el/yasnippet/snippets")