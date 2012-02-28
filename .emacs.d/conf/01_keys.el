
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
(global-set-key (kbd "<f11>") 'magit-status)

; views
(global-set-key (kbd "<f2>") '(lambda () ( (interactive) (ansi-term "screen" "screen"))))
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f5>") 'bh/org-todo)
(global-set-key (kbd "<S-f5>") 'bh/widen)
(global-set-key (kbd "<f7>") 'set-truncate-lines)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f9> h") 'bh/hide-other)

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
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-<f10>") 'next-buffer)

; org-mode
(global-set-key (kbd "<f8>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
(global-set-key (kbd "M-<f11>") 'org-resolve-clocks)
(global-set-key (kbd "C-M-r") 'org-capture)
(global-set-key (kbd "M-<f9>") (lambda ()
                                 (interactive)
                                 (unless (buffer-modified-p)
                                   (kill-buffer (current-buffer)))
                                 (delete-frame)))

(global-set-key (kbd "<f9> I") 'bh/clock-in)
(global-set-key (kbd "<f9> O") 'bh/clock-out)
;(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> s") 'bh/go-to-scratch)
;(global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
(global-set-key (kbd "<f9> u") 'bh/untabify)
(global-set-key (kbd "<f9> i") 'bh/org-info)
(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)

(defun bh/hide-other ()
  (interactive)
  (save-excursion
    (org-back-to-heading)
    (org-shifttab)
    (org-reveal)
    (org-cycle)))

(defun bh/org-info ()
  (interactive)
  (info "~/git/org-mode/doc/org.info"))

(defun bh/go-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*")
  (delete-other-windows))

(defun bh/untabify ()
  (interactive)
  (untabify (point-min) (point-max)))

; fullscreen!
(defun toggle-fullscreen (&optional f)
      (interactive)
      (let ((current-value (frame-parameter nil 'fullscreen)))
           (set-frame-parameter nil 'fullscreen
                                (if (equal 'fullboth current-value)
                                    (if (boundp 'old-fullscreen) old-fullscreen nil)
                                    (progn (setq old-fullscreen current-value)
                                           'fullboth)))))
    (global-set-key [f11] 'toggle-fullscreen)