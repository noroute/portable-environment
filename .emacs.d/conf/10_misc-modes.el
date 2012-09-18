; Provide more packages than available in GNU
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

(require 'whitespace)

; Automatic encryption with EasyPG
(require 'epa-file)
(epa-file-enable)

(require 'project-mode)
(project-load-all)

; override perl-mode
(defalias 'perl-mode 'cperl-mode)

(autoload 'cperl-mode "cperl-mode" t)
(add-hook 'cperl-mode-hook
	  '(lambda ()
	    (define-key cperl-mode-map "\C-cf" 'cperl-perldoc-at-point)
	    (define-key cperl-mode-map "\C-cF" 'cperl-perldoc)))
(add-hook 'cperl-mode-hook 'run-coding-hook)

; ESS
(autoload 'ess-site "ess-site" "Emacs speaks statistics" t)
(setq inferior-R-program-name "/opt/local/bin/R")

; misc
(autoload 'python-mode "python-mode" "Python!" t)
(add-hook 'python-mode-hook 'run-coding-hook)
(autoload 'php-mode "php-mode" "PHP mode." t)
(add-hook 'php-mode-hook 'run-coding-hook)
(autoload 'ruby-mode "ruby-mode" "Ruby" t)
(add-hook 'ruby-mode-hook 'run-coding-hook)

; Puppet
(setq auto-mode-alist
      (cons '("\\.pp" . puppet-mode) auto-mode-alist))
(add-hook 'puppet-mode-hook 'run-coding-hook)

; auto-mode settings
(add-to-list 'auto-mode-alist '("\\.php\\w?" . php-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
