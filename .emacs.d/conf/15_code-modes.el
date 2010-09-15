; override perl-mode
(defalias 'perl-mode 'cperl-mode)

(autoload 'cperl-mode "cperl-mode" t)
(add-hook 'cperl-mode-hook
	  '(lambda ()
	    (define-key cperl-mode-map "\C-cf" 'cperl-perldoc-at-point)
	    (define-key cperl-mode-map "\C-cF" 'cperl-perldoc)))
