(require 'tex-site)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'remember)
(require 'org)

(setq org-directory "~/org")

; make org-mode use diaries! Yay!
(setq org-agenda-include-diary t)

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "WAITING" "|" "DONE" "DELEGATED")))

;; Org
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-c \C-q" 'org-set-tags)

;; remember-bindings
(setq org-default-notes-file (concat org-directory "/inbox.org"))
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)

(global-set-key (kbd "C-c C-r") 'org-remember)

;; diary
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ERC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'erc "erc" "Emacs Relay Chat" t)
(autoload 'erc-spelling "erc-spelling" "ERC Spellchecker" t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; yasnippets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path
             "~/.emacs.d/el/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/el/yasnippet-0.6.1c/snippets")

; Git
(when onmacp
  (add-to-list 'load-path "/opt/local/share/doc/git-core/contrib/emacs"))
(require 'git)
(require 'git-blame)
; let vc- handle Git
(add-to-list 'vc-handled-backends 'Git)