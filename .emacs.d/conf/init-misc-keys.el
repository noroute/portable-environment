; prefer backward-kill-word!
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

; annoying ctrl-z!
(global-set-key "\C-z" nil)

; frame handling
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)
(define-key global-map (kbd "C-x C-n") 'make-frame-command)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

; Join from anywhere
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))
