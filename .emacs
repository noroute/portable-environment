(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

; check if we're running on linux or mac

(defvar linuxp (string-match "linux" (symbol-name system-type)))
(defvar darwinp (string-match "darwin" (symbol-name system-type)))

(defvar my-dotemacs "~/.emacs")
(defvar my-emacs-dir "~/.emacs.d/")
(defvar my-config-dir "~/.emacs.d/conf")

; need this for conf-file loading to work
(add-to-list 'load-path my-config-dir)

; load separated config files
(mapc (lambda (x) (load (substring x 0 -3)))
      (directory-files my-config-dir nil "^[0-9][0-9]\_.*el$"))

;;;;;;;;; EmacsClient ;;;;;;;;;

(defun emacsclient-onStart()
  "for server-visit-hook"
  (if window-system
      (progn (set-frame-height (make-frame) 25)
	     (tool-bar-mode 0)
	     (auto-fill-mode))))
             ;(raise-frame))))
(add-hook 'server-visit-hook '(lambda() (emacsclient-onStart)))

;; this hook is run when emacsclient is closed (ie. buffer is closed)
;; remember to close the buffer with 'C-x #' (see emacs docs for details)
;; this just closes the opened frame
(defun emacsclient-onClose()
  "for server-done-hook"
  (if window-system
      (progn (kill-buffer (buffer-name))
             (delete-frame))))
(add-hook 'server-done-hook '(lambda() (emacsclient-onClose)))

(server-start)