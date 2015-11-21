(require 'req-package)

(req-package clojure-cheatsheet
  :require (helm clojure-mode cider)
  :commands clojure-cheatsheet
  :init (progn (define-key clojure-mode-map (kbd "C-h j") 'clojure-cheatsheet)
               (define-key cider-repl-mode-map (kbd "C-h j") 'clojure-cheatsheet)))

(req-package clojure-mode
  :mode (("clj\\'" . clojure-mode)
		 ("cljs\\'" . clojure-mode)))

(req-package clojure-mode-extra-font-locking
  :require clojure-mode)

(req-package cider
  :require (clojure-mode eldoc)
  :commands cider-mode cider-jack-in-clojurescript
  :init (progn (req-package-hooks-add-execute 'clojure-mode #'cider-mode)
			   (req-package-hooks-add-execute 'cider-mode #'eldoc-mode))
  :config
  (setq nrepl-log-messages t)
  (define-key cider-mode-map (kbd "C-c M-J") 'cider-jack-in-clojurescript))

(req-package slamhound
  :require cider
  :commands slamhound)

(req-package cider-profile
  :require cider
  :commands cider-profile-mode
  :init (progn (req-package-hooks-add-execute 'cider-mode 'cider-profile-mode)
               (req-package-hooks-add-execute 'cider-repl-mode 'cider-profile-mode)))

(req-package clj-refactor
  :require cider
  :commands clj-refactor-mode
  :init (req-package-hooks-add-execute 'cider-mode #'clj-refactor-mode))

(req-package cljr-helm
  :require clj-refactor
  :commands cljr-helm
  :init (define-key clojure-mode-map (kbd "M-RET") 'cljr-helm))

(req-package 4clojure
  :commands (4clojure-check-answers 4clojure-open-question))

(req-package typed-clojure-mode
  :require clojure-mode
  :commands typed-clojure-mode
  :init (req-package-hooks-add-execute 'clojure-mode 'typed-clojure-mode))

(req-package flycheck-clojure
  :disabled t
  :require (clojure-mode flycheck)
  :config
  (req-package-hooks-add-execute 'clojure-mode
    (lambda ()
      ;; currently not working with cljs
      (add-to-list 'flycheck-disabled-checkers 'clojure-cider-typed)
      (add-to-list 'flycheck-disabled-checkers 'clojure-cider-kibit)
      (add-to-list 'flycheck-disabled-checkers 'clojure-cider-eastwood)))
  (flycheck-clojure-setup))

(req-package clojure-snippets
  :require (clojure-mode yasnippet)
  :config (clojure-snippets-initialize))

(req-package align-cljlet
  :require clojure-mode)

(req-package cljsbuild-mode
  :commands cljsbuild-start)

(req-package sotclojure :disabled t)

(provide 'init-clojure)
