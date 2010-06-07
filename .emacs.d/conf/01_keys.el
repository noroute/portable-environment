
; general
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-cu" 'uncomment-region)

; annoying ctrl-z!
(global-set-key "\C-z" nil)

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

(defun switch-to (buffername)
  (lambda ()
    (interactive)
    (switch-to-buffer buffername)))

(defun start-shell ()
  (lambda ()
    (interactive)
    (ansi-term "screen" "screen")))

(global-set-key (kbd "C-+") 'font-inc-size)
(global-set-key (kbd "C--") 'font-dec-size)

; views
(global-set-key (kbd "<f1>") (switch-to "*scratch*"))
(global-set-key (kbd "<f2>") '(lambda () ( (interactive) (ansi-term "screen" "screen"))))
(global-set-key (kbd "<f5>") 'org-agenda)
(global-set-key (kbd "<f6>") 'calendar)


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