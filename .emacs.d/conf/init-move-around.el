(require 'req-package)

(req-package ace-window
  :require key-chord
  :bind ("C-x o" . ace-window)
  :init (key-chord-define-global ";o" 'ace-window))

(req-package ace-jump-mode
  :bind (("M-/" . ace-jump-word-mode)
         ("s-c" . ace-jump-char-mode)
         ("M-g M-g" . ace-jump-line-mode)))

(req-package ace-link :config (ace-link-setup-default))


(req-package ace-jump-buffer
  :require (shell)
  :bind ("M-?" . ace-jump-buffer))

(req-package move-text
  :config (progn (global-set-key (kbd "M-n") 'move-text-down)
                 (global-set-key (kbd "M-p") 'move-text-up)))
