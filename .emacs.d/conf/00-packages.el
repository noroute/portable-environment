(require 'package)
(dolist (source '(("melpa" . "http://melpa.org/packages/")
                  ("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source t))
(package-initialize)

(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

(setq extra-packages '(
                       ack-and-a-half
                       cider
                       clojure-mode
                       clojure-snippets
                       clojure-test-mode
                       crontab-mode
                       csv-mode
                       diminish
                       epl
                       flx-ido
                       flycheck
                       gist
                       gitconfig-mode
                       gitignore-mode
                       guru-mode
                       haskell-mode
                       helm
                       helm-projectile
                       ido-ubiquitous
                       inf-ruby
                       jinja2-mode
                       json-mode
                       json-reformat
                       key-chord
                       magit
                       magit-svn
                       pbcopy
                       projectile
                       rainbow-delimiters
                       rainbow-mode
                       rpm-spec-mode
                       ruby-tools
                       scss-mode
                       smartparens
                       undo-tree
                       vagrant
                       web-mode
                       yasnippet
                       zenburn-theme
                       ace-jump-mode))

(dolist (package extra-packages)
  (unless (package-installed-p package)
    (package-install package)))
