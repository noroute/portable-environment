
; general
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cu" 'uncomment-region)

; annoying ctrl-z!
(global-set-key "\C-z" nil)

(defun make-open-file (filename)
  "produce an interactive open-file command for use with set-key"
  (lambda ()
    (
     (interactive)
     (find-file filename))))

; edit files (prefix: <f6>)
(global-set-key (kbd "<f6> e") (make-open-file "~/.emacs.d/conf"))
(global-set-key (kbd "<f6> z") (make-open-file "~/.zshrc"))

; outline-mode
(global-set-key [M-left] 'hide-body)
(global-set-key [M-right] 'show-all)
(global-set-key [M-up] 'outline-previous-heading)
(global-set-key [M-down] 'outline-next-heading)
(global-set-key [C-M-left] 'hide-sublevels)
(global-set-key [C-M-right] 'show-children)
(global-set-key [C-M-up] 'outline-previous-visible-heading)
(global-set-key [C-M-down] 'outline-next-visible-heading)

(defun font-inc-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun font-dec-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                  (face-attribute 'default :height)))))

(global-set-key (kbd "C-+") 'font-inc-size)
(global-set-key (kbd "C--") 'font-dec-size)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key (kbd "C-x C-i") 'ido-imenu)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-project)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)