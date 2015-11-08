(require 'req-package)

;; key chord mode

(req-package key-chord
  :config (progn (key-chord-define-global "qw" 'kill-this-buffer)
                 (key-chord-define-global "qq" 'kill-this-buffer)
                 (key-chord-define-global ";2" 'split-window-below)
                 (key-chord-define-global ";3" 'split-window-right)
                 (key-chord-define-global ";4" 'kill-buffer-and-window)
                 (key-chord-define-global ";n" 'scroll-up-command)
                 (key-chord-define-global ";h" 'scroll-down-command)
                 (key-chord-define-global ";/" 'undo)
                 (key-chord-define-global ";u" "\C-u")
                 (key-chord-define-global ";j" "\C-n")
                 (key-chord-define-global ";k" "\C-p")
                 (key-chord-define-global ";g" "\C-g")
                 (key-chord-define-global "1e" "\C-a")
                 (key-chord-define-global "2e" "\C-a\t")
                 (key-chord-define-global "3e" "\C-e")
                 (key-chord-define-global "4e" "\C-e ")
                 (key-chord-mode 1)))

(provide 'init-chords)
