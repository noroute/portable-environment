;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; org-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'remember)
(org-remember-insinuate)
(require 'org)

(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/refile.org"))

; make org-mode use diaries! Yay!
(setq org-agenda-include-diary t)

(setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
 (sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)")
 (sequence "QUOTE(q!)" "QUOTED(Q!)" "|" "APPROVED(A@)" "EXPIRED(E@)" "REJECTED(R@)")
 (sequence "OPEN(O)" "|" "CLOSED(C)"))))

(setq org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
 ("NEXT" :foreground "blue" :weight bold)
 ("DONE" :foreground "forest green" :weight bold)
 ("WAITING" :foreground "yellow" :weight bold)
 ("SOMEDAY" :foreground "goldenrod" :weight bold)
 ("CANCELLED" :foreground "orangered" :weight bold)
 ("QUOTE" :foreground "hotpink" :weight bold)
 ("QUOTED" :foreground "indianred1" :weight bold)
 ("APPROVED" :foreground "forest green" :weight bold)
 ("EXPIRED" :foreground "olivedrab1" :weight bold)
 ("REJECTED" :foreground "olivedrab" :weight bold)
 ("OPEN" :foreground "magenta" :weight bold)
 ("CLOSED" :foreground "forest green" :weight bold))))

;; auto-tag by state, makes for easy filtering, YAY!
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED"
               ("CANCELLED" . t))
              ("WAITING"
               ("WAITING" . t))
              ("SOMEDAY"
               ("WAITING" . t))
              (done
               ("WAITING"))
              ("TODO"
               ("WAITING")
               ("CANCELLED"))
              ("NEXT"
               ("WAITING"))
              ("DONE"
               ("WAITING")
               ("CANCELLED")))))

;; Org
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-c \C-q" 'org-set-tags)

; make org note the time for everytime I completed recurring tasks
(setq org-log-repeat "time")

;; allow state selection by keys
(setq org-use-fast-todo-selection t)

;; S-cursor state changes (fixing states) must not trigger updates
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; remember-bindings
;(setq remember-annotation-functions '(org-remember-annotation))
;(setq remember-handler-functions '(org-remember-handler))
;(add-hook 'remember-mode-hook 'org-remember-apply-template)

(global-set-key (kbd "C-M-r") 'org-remember)
(setq org-remember-store-without-prompt t)

(setq org-remember-templates (quote (("todo" ?t "* TODO %?\n %U\n %a" nil bottom nil)
                                     ("note" ?n "* %?                                     :NOTE:\n %U\n %a\n :CLOCK:\n  :END:" nil bottom nil)
                                      ("appointment" ?a "* %?\n %U" (concat org-directory "todo.org") "Appointments" nil)
                                      ("org-protocol" ?w "* TODO Review %c%!\n %U" nil bottom nil))))

;; refiling setup
; Use IDO for target completion
(setq org-completion-use-ido t)

; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))

; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))

; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps t)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;; diary
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)