(require 'req-package)

;; M-v always undoes C-v
(setq scroll-preserve-screen-position 'always)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(req-package timeclock
  :config (progn (display-time-mode 1)))

(req-package highlight-numbers
  :config (req-package-hooks-add-execute 'find-file (lambda () (highlight-numbers-mode 1))))

(req-package beacon
  :config (beacon-mode))

(req-package pretty-lambdada
  :config
  (pretty-lambda-for-modes))

(req-package menu-bar
  :config
  (menu-bar-mode -1))

(req-package smart-mode-line
  :config
  (progn (setq sml/shorten-modes t)
         (setq sml/shorten-directory t)
         (setq sml/name-width 20)
         (setq sml/mode-width 'full)
         (setq sml/hidden-modes nil)
         (setq sml/theme nil)
         (add-to-list 'sml/hidden-modes " Anzu")
         (add-to-list 'sml/hidden-modes " AC")
         (add-to-list 'sml/hidden-modes " yas")
         (add-to-list 'sml/hidden-modes " pair")
         (add-to-list 'sml/hidden-modes " FIC")
         (add-to-list 'sml/hidden-modes " Abbrev")
         (add-to-list 'sml/hidden-modes " ARev")
         (sml/setup)))

(req-package anzu
  :require
  smart-mode-line
  :config
  (global-anzu-mode 1))

(req-package simple
  :config
  (column-number-mode 1))

(req-package tool-bar
  :config
  (tool-bar-mode -1))

;; scroll bar

(req-package scroll-bar
  :config
  (scroll-bar-mode -1))

(req-package fic-mode
  :config
  (req-package-hooks-add-execute 'prog-mode (lambda () (fic-mode 1))))

(req-package rainbow-delimiters
  :require clojure-mode
  :commands rainbow-delimiters-mode
  :init (progn (custom-set-variables '(rainbow-delimiters-max-face-count 8))
               (custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:inherit org-level-1)))))
               (custom-set-faces '(rainbow-delimiters-depth-2-face ((t (:inherit org-level-2)))))
               (custom-set-faces '(rainbow-delimiters-depth-3-face ((t (:inherit org-level-3)))))
               (custom-set-faces '(rainbow-delimiters-depth-4-face ((t (:inherit org-level-4)))))
               (custom-set-faces '(rainbow-delimiters-depth-5-face ((t (:inherit org-level-5)))))
               (custom-set-faces '(rainbow-delimiters-depth-6-face ((t (:inherit org-level-6)))))
               (custom-set-faces '(rainbow-delimiters-depth-7-face ((t (:inherit org-level-7)))))
               (custom-set-faces '(rainbow-delimiters-depth-8-face ((t (:inherit org-level-8)))))
               (req-package-hooks-add-execute 'emacs-lisp-mode (lambda () (rainbow-delimiters-mode 1)))
               (req-package-hooks-add-execute 'clojure-mode (lambda () (rainbow-delimiters-mode 1)))))

(req-package diff-hl
  :require smartrep
  :config (global-diff-hl-mode 1))


(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)


(setq make-pointer-invisible nil)


(provide 'init-look-and-feel)
