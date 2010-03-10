; override perl-mode
(defalias 'perl-mode 'cperl-mode)

(autoload 'cperl-mode "cperl-mode" t)
(add-hook 'cperl-mode-hook
	  '(lambda ()
	    (define-key cperl-mode-map "\C-cf" 'cperl-perldoc-at-point)
	    (define-key cperl-mode-map "\C-cF" 'cperl-perldoc)))

;path to where nxml is
;(set 'nxml-path (concat site-lisp-path "nxml-mode/"))
;(load (concat nxml-path "rng-auto.el"))
;(add-to-list 'auto-mode-alist
;             (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss" "xhtml") t) "\\'")
;                   'nxml-mode))

; ESS
(add-to-list 'load-path
             "~/.emacs.d/el/ess-5.7.1/lisp")
(require 'ess-site)
(setq inferior-R-program-name "/opt/local/bin/R")

; misc
(load "python-mode.el")
;(load "ecb")

(setq auto-mode-alist
  (cons '("\\.php\\w?" . php-mode) auto-mode-alist))
(autoload 'php-mode "php-mode" "PHP mode." t)
