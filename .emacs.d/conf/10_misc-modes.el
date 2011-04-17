; Automatic encryption with EasyPG
(require 'epa-file)
(epa-file-enable)

(require 'tex-site)
(require 'magit)

(add-to-list 'load-path "~/.emacs.d/el/twittering-mode")
(require 'twittering-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/el/yasnippet/snippets")

;;;;;;;;;;;;;;;;;;;;
; thunderbird ExternalEditor integration
;;;;;;;;;;;;;;;;;;;;
(defun my-message-mode-for-buffers (mail-header-separator-text)
  "Activate message mode for buffers."
  (interactive "*")
  (require 'message)
  (require 'gnus-cite)
  (if (eq major-mode 'message-mode)
      (error "Message-mode is already active")
    (progn
      (message-mode)
      (set (make-local-variable 'mail-header-separator)
           mail-header-separator-text)
      (turn-on-gnus-message-citation-mode)
      (delete-other-windows))))

(defun my-message-mode-for-thunderbird ()
  "Message mode for messages from Thunderbird per Add-On ExternalEditor."
  (interactive "*")
  (my-message-mode-for-buffers
"-=-=-=-=-=-=-=-=-=# Diese Zeile unbedingt stehen lassen - unterhalb beginnen Sie Ihren Mailtext #=-=-=-=-=-=-=-=-=-"))

(setq auto-mode-alist
      (cons '("\\.eml\\'" . my-message-mode-for-thunderbird) auto-mode-alist))