; override perl-mode
(defalias 'perl-mode 'cperl-mode)

(autoload 'cperl-mode "cperl-mode" t)
(add-hook 'cperl-mode-hook
	  '(lambda ()
	    (define-key cperl-mode-map "\C-cf" 'cperl-perldoc-at-point)
	    (define-key cperl-mode-map "\C-cF" 'cperl-perldoc)))
(add-hook 'cperl-mode-hook 'run-coding-hook)

;path to where nxml is
;(set 'nxml-path (concat site-lisp-path "nxml-mode/"))
;(load (concat nxml-path "rng-auto.el"))
;(add-to-list 'auto-mode-alist
;             (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss" "xhtml") t) "\\'")
;                   'nxml-mode))

; ESS
(autoload 'ess-site "ess-site" "Emacs speaks statistics" t)
(setq inferior-R-program-name "/opt/local/bin/R")

; misc
(autoload 'python-mode "python-mode" "Python!" t)
(add-hook 'python-mode-hook 'run-coding-hook)
(autoload 'ecb "ecb-activate" "Emacs IDE" t)
(autoload 'php-mode "php-mode" "PHP mode." t)
(add-hook 'php-mode-hook 'run-coding-hook)
(autoload 'ruby-mode "ruby-mode" "Ruby" t)
(add-hook 'ruby-mode-hook 'run-coding-hook)

; Puppet
(add-to-list 'load-path "~/git/puppet-syntax-emacs")
(autoload 'puppet-mode "puppet-mode.el")
(setq auto-mode-alist
   (cons '("\\.pp" . puppet-mode) auto-mode-alist))
(add-hook 'puppet-mode-hook 'run-coding-hook)

; auto-mode settings
(add-to-list 'auto-mode-alist '("\\.php\\w?" . php-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
