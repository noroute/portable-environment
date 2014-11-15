(defvar my-emacs-dir "~/.emacs.d/")
(defvar my-config-dir "~/.emacs.d/conf/")
(defvar my-prelude-dir (concat my-emacs-dir "prelude"))

; config is mostly prelude
(load (concat my-prelude-dir "/init.el"))

; need this for conf-file loading to work
(add-to-list 'load-path my-config-dir)

; load personal config files
(mapc (lambda (x) (load (substring x 0 -3)))
      (directory-files my-config-dir nil "^.*el$"))
