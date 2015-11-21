(require 'req-package)

(setq-default bookmark-save-flag 1)

(setq use-dialog-box nil)
(setq enable-local-variables nil)
(defalias 'yes-or-no-p 'y-or-n-p)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(req-package saveplace
  :config (progn ((setq save-place-file (expand-file-name "saveplace" my-emacs-dir))
		  (setq-default save-place t))))

(req-package savekill
  :config (progn (setq savekill-max-saved-items nil)
                 (load save-kill-file-name t)))

(req-package savehist
  :config (savehist-mode 1))

(req-package recentf
  :config (recentf-mode 1))

(req-package zygospore
  :require key-chord
  :commands zygospore-toggle-delete-other-windows
  :init (key-chord-define-global ";1" 'zygospore-toggle-delete-other-windows))

(req-package multifiles
  :bind ("C-!" . mf/mirror-region-in-multifile))

(req-package-hooks-add-execute 'before-save 'delete-trailing-whitespace)

(req-package smex
  :require key-chord
  :bind ("M-x" . smex)
  :config (smex-initialize))

(req-package string-edit
  :config (global-set-key (kbd "C-c e") 'string-edit-at-point))

(req-package paradox
  :require key-chord
  :commands paradox-list-packages
  :init (key-chord-define-global ";p" 'paradox-list-packages))

(req-package duplicate-thing
  :config (progn (global-set-key (kbd "C-c d") 'duplicate-thing)))

(req-package expand-region
  :require key-chord
  :init (key-chord-define-global "xx" 'er/expand-region)
  :bind ("C-=" . er/expand-region))

(req-package rotate
  :config
  (global-set-key (kbd "s-r") 'rotate-layout))

(req-package zop-to-char
  :bind (("M-z" . zop-to-char)
	 ("M-Z" . zop-up-to-char)))

(defun rename-buffer-and-file ()
  "Rename current buffer and if the buffer is visiting a file, rename it too."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (rename-buffer (read-from-minibuffer "New name: " (buffer-name)))
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (when (y-or-n-p (format "Are you sure you want to delete %s? " filename))
          (delete-file filename delete-by-moving-to-trash)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

(global-set-key (kbd "C-c r") 'rename-buffer-and-file)
(global-set-key (kbd "C-c D") 'delete-buffer-and-file)

(provide 'init-feel)
