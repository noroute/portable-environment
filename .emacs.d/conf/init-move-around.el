(require 'req-package)

(req-package ace-window
  :require key-chord
  :bind ("s-w" . ace-window)
  :init (key-chord-define-global ";o" 'ace-window))

(req-package ace-link :config (ace-link-setup-default))

(req-package goto-chg
  :config (progn (global-set-key (kbd "C-c b ,") 'goto-last-change)
		 (global-set-key (kbd "C-c b ." 'goto-last-change-reverse))))

(req-package ace-jump-buffer
  :require (shell)
  :bind ("M-?" . ace-jump-buffer))

(req-package avy
  :bind (("C-c j" . avy-goto-word-or-subword-1)
         ("s-." . avy-goto-word-or-subword-1)))

(req-package move-text
  :config (progn (global-set-key (kbd "M-n") 'move-text-down)
                 (global-set-key (kbd "M-p") 'move-text-up)))

(req-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)))

(defun smart-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.
If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(global-set-key [remap move-beginning-of-line]
                'smart-move-beginning-of-line)

;; Visual regexp
(req-package visual-regexp
  :bind ("C-c m" . vr/mc-mark))

;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))
