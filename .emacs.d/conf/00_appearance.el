;;;;;;;;; Appearance Stuff ;;;;;;;;;

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  ;(set-cursor-color 'darkgrey)
  (blink-cursor-mode -1))

(defun set-german-input-method nil
  (set-input-method 'german-postfix))
 
(add-hook 'before-make-frame-hook 'turn-off-tool-bar)
(add-hook 'text-mode-hook 'set-german-input-method)
 
;(mouse-wheel-mode t)
;(set-terminal-coding-system 'utf-8)
;(set-keyboard-coding-system 'utf-8)
;(prefer-coding-system 'utf-8)
 
(setq visible-bell t
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      delete-by-moving-to-trash t
      shift-select-mode nil
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file "~/.emacs.d/places")
 
;; Set this to whatever browser you use
(setq browse-url-browser-function 'browse-url-default-macosx-browser)
 
;; Transparently open compressed files
(auto-compression-mode t)
 
;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)
 
;; Save a list of recent files visited.
(recentf-mode 1)
 
;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; save desktop
(desktop-save-mode 1)
 
;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-fiename-at-point 'guess
        ido-max-prospects 10))
 
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)
 
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)

(setq inhibit-startup-message t) ;no startup message
(setq indicate-empty-lines t)
(setq visible-bell t)

;; Default to unified diffs
(setq diff-switches "-u")

(defvar coding-hook nil
  "Hook that gets run on activation of any programming mode.")
 
(defalias 'yes-or-no-p 'y-or-n-p)
(random t) ;; Seed the random-number generator

(setq abbrev-file-name "~/.emacs.d/abbrev_defs.el")
(read-abbrev-file abbrev-file-name t)
(setq dabbrev-case-replace nil)  ; Preserve case when expanding
(setq abbrev-mode t)
 
;; Hippie expand: at times perhaps too hip
(delete 'try-expand-line hippie-expand-try-functions-list)
(delete 'try-expand-list hippie-expand-try-functions-list)

;; ignored extensions
(setq completion-ignored-extensions
      '(".o" ".elc" ".class" ".pyc" ".ps" ".pdf" ".log" ".aux" ".rel"))
;(setq message-log-max nil) ; get rid of Messages buffer
;(kill-buffer "*Messages*")

; auto-recompile .emacs and all files in my conf directory
(defun autocompile nil
  "recompile neccessary files"
  (interactive)
  (require 'bytecomp)
  (cond
   ((string= (buffer-file-name) (expand-file-name my-dotemacs))
    (byte-compile-file my-dotemacs))
   ((string= (file-name-directory buffer-file-name) my-config-dir)
    (byte-compile-file buffer-file-name)
    (byte-compile-file my-dotemacs))))
			  
(add-hook 'after-save-hook 'autocompile)

;; place backups in one place
(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.emacs.d/backups"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)       ; use versioned backups

;; initial layout
(setq default-frame-alist '((width . 100)
			    (height . 80)))
(setq initial-frame-alist default-frame-alist)