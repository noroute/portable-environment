; Automatic encryption with EasyPG
(require 'epa-file)
(epa-file-enable)

;(require 'tex-site)
;(require 'magit)

(add-to-list 'load-path "~/git/puppet-syntax-emacs")
(autoload 'puppet-mode "puppet-mode.el")
(setq auto-mode-alist
   (cons '("\\.pp" . puppet-mode) auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "~/.emacs.d/el/yasnippet-mode")
;(require 'yasnippet)
;(yas/global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; markdown
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))
