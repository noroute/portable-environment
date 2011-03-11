;;;;;;;;; Custom Variables (not belonging to other config files) ;;;;;;;;;

(setq flyspell-default-dictionary "deutsch8")
(setq python-python-command "python2.5")
(setq browse-url-generic-program (executable-find "firefox")
      browse-url-browser-function 'browse-url-generic)

; cache EPA passphrase to avoid typing everything over and over again
(setq epa-file-cache-passphrase-for-symmetric-encryption t)