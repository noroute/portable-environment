; Automatic encryption with EasyPG
(require 'epa-file)
(epa-file-enable)

(add-hook 'cperl-mode-hook 'run-coding-hook)

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
