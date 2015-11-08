(require 'server)
(unless (server-running-p)
  (server-start))

(defvar my-emacs-dir "~/.emacs.d/")
(defvar my-config-dir "~/.emacs.d/conf/")
(defvar my-prelude-dir (concat my-emacs-dir "prelude"))

; config is mostly prelude
(load (concat my-prelude-dir "/init.el"))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

(require-package 'req-package)
(require 'req-package)

(req-package-force load-dir
  :defer 1
  :init (progn (setq force-load-messages nil)
               (setq load-dir-debug nil)
               (setq load-dir-recursive t))
  :config (progn (load-dir-one my-config-dir)
                 (req-package-finish)))

; need this for conf-file loading to work
(add-to-list 'load-path my-config-dir)

; load personal config files
(mapc (lambda (x) (load (substring x 0 -3)))
      (directory-files my-config-dir nil "^.*el$"))
