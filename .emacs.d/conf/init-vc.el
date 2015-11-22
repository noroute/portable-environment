(require 'req-package)

;; use timemachine

(req-package git-timemachine)

;; magit

(req-package magit
  :require key-chord
  :commands magit-status
  :init (progn (key-chord-define-global ";m" 'magit-status)
	       (global-set-key (kbd "C-x v l") 'magit-log-buffer-file)
	       (global-set-key (kbd "C-x v r") 'magit-reset-hard)
	       (global-set-key (kbd "C-x v t") 'magit-stash)
               (setq magit-last-seen-setup-instructions "1.4.0")
               (setq magit-auto-revert-mode t))
  :config (progn (key-chord-define magit-log-mode-map ";j" "n")
                 (key-chord-define magit-log-mode-map ";k" "p")))

;; git flow

(req-package magit-gitflow
  :require magit
  :commands turn-on-magit-gitflow
  :init (req-package-hooks-add-execute 'magit-mode 'turn-on-magit-gitflow))

;; magit svn

(req-package magit-svn :require magit)

;; helm ls git

(req-package helm-ls-git
  :require helm
  :bind ("M-+" . helm-ls-git-ls))

;; git config mode

(req-package gitconfig-mode)

;; git ignore mode

(req-package gitignore-mode)

;; git message

(req-package git-messenger
  :bind ("C-x v p" . git-messenger:popup-message))

;; git blame

(req-package git-blame)

;; git attributes editing

(req-package gitattributes-mode)

;; tweak ediff

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq-default ediff-ignore-similar-regions t)
(setq-default ediff-highlight-all-diffs nil)

(provide 'init-vc)
