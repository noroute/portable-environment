(require 'server)
(unless (server-running-p)
  (server-start))

(add-hook 'kill-emacs-hook (lambda () (byte-recompile-directory my-config-dir 0 t)))

(defvar my-emacs-dir "~/.emacs.d/")
(defvar my-config-dir "~/.emacs.d/conf/")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(eval-when-compile (package-initialize))

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
