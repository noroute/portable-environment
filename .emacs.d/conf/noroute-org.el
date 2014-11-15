;;; noroute-org.el -- Org mode!

(package-require 'remember)
(require 'remember)
(package-require 'org)
(require 'org)

(setq org-directory "~/org")
(setq org-default-notes-file (concat org-directory "/refile.org"))

                                        ; views
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)

                                        ; org-mode
(global-set-key (kbd "<f8>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "M-<f11>") 'org-resolve-clocks)
(global-set-key (kbd "C-M-r") 'org-capture)


; make org-mode use diaries! Yay!
(setq org-agenda-include-diary t)

(setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                                (sequence "BACKLOG(b)" "READY(r)" "INPROGRESS(i)" "TEST(T)")
                                (sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)")
                                (sequence "FEEDBACK(f)" "EXPIRED(E@)" "REJECTED(R@)" "DELEGATED(D)")
                                (sequence "OPEN(O)" "|" "CLOSED(C)"))))

(setq org-todo-keyword-faces (quote
 (("TODO" :foreground "red" :weight bold)
  ("NEXT" :foreground "blue" :weight bold)
  ("DONE" :foreground "forest green" :weight bold)
  ("WAITING" :foreground "yellow" :weight bold)
  ("SOMEDAY" :foreground "goldenrod" :weight bold)
  ("CANCELLED" :foreground "orangered" :weight bold)
  ("FEEDBACK" :foreground "magenta" :weight bold)
  ("EXPIRED" :foreground "olivedrab1" :weight bold)
  ("REJECTED" :foreground "olivedrab" :weight bold)
  ("OPEN" :foreground "magenta" :weight bold)
  ("CLOSED" :foreground "forest green" :weight bold)
  ("DELEGATED" :forground "yellow" :weight bold))))

;; auto-tag by state, makes for easy filtering, YAY!
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED"
               ("CANCELLED" . t))
              ("WAITING"
               ("WAITING" . t))
              ("SOMEDAY"
               ("WAITING" . t))
              ("BACKLOG"
                ("BACKLOG" . t)
                ("INPROGRESS")
                ("READY")
                ("TEST"))
              ("READY"
               ("READY" .t)
               ("BACKLOG")
               ("INPROGRESS")
               ("TEST")
               ("WAITING"))
              ("INPROGRESS"
               ("INPROGRESS" .t)
               ("WAITING")
               ("CANCELLED")
               ("BACKLOG")
               ("READY"))
              ("TEST"
               ("TEST" .t)
               ("INPROGRESS")
               ("BACKLOG"))
              ("TODO"
               ("WAITING")
               ("CANCELLED"))
              ("DONE"
               ("WAITING")
               ("CANCELLED"))
              (done
               ("WAITING")
               ("INPROGRESS")
               ("TEST")
               ("READY")))))


;; Org
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cq" 'org-set-tags)

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

(setq org-remember-templates (quote (("backlog" ?b "* BACKLOG %? :REFILE:BACKLOG: \n %U\n %a\n" nil bottom nil)
                                     ("note" ?n "* %?                                     :NOTE:\n %U\n %a\n :CLOCK:\n  :END:" nil bottom nil)
("journal" ?j "* %?\n %T\n %a" nil bottom nil))))

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
(setq calendar-view-diary-initially-flag t
      calendar-mark-diary-entries-flag t
      diary-number-of-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;;;;;;;;;; Clocking ;;;;;;;;;;

(defun bh/clock-in-to-next (kw)
  "Switch task from TODO to NEXT when clocking in.
Skips capture tasks and tasks with subtasks"
  (if (and (string-equal kw "TODO")
           (not (and (boundp 'org-capture-mode) org-capture-mode)))
      (let ((subtree-end (save-excursion (org-end-of-subtree t)))
            (has-subtask nil))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-not-done-keywords)
              (setq has-subtask t))))
        (when (not has-subtask)
          "NEXT"))))

;; Remove empty CLOCK drawers on clock out
(defun bh/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "CLOCK" (point))))

(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)

;; Agenda ;;

;; custom agenda commands
(setq org-agenda-custom-commands
      (quote (("w" "Tasks waiting on something" tags "WAITING/!"
               ((org-tags-exclude-from-inheritance '("WAITING"))
                (org-agenda-todo-ignore-scheduled nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-todo-ignore-with-date nil)
                (org-agenda-overriding-header "Waiting Tasks")))
              ("r" "Refile New Notes and Tasks" tags "LEVEL=1+REFILE"
               ((org-agenda-todo-ignore-with-date nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-todo-ignore-scheduled nil)
                (org-agenda-overriding-header "Tasks to Refile")))
              ("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")))
              ("p" "Projects" tags-todo "LEVEL=2-REFILE|LEVEL=1+REFILE/!-DONE-CANCELLED"
               ((org-agenda-skip-function 'bh/skip-non-projects)
                (org-agenda-overriding-header "Projects")))
              ("o" "Other (Non-Project) tasks" tags-todo "LEVEL=2-REFILE|LEVEL=1+REFILE/!-DONE-CANCELLED"
               ((org-agenda-skip-function 'bh/skip-projects)
                (org-agenda-overriding-header "Other Non-Project Tasks")))
              ("A" "Tasks to be Archived" tags "LEVEL=2-REFILE/DONE|CANCELLED"
               ((org-agenda-overriding-header "Tasks to Archive")))
              ("h" "Habits" tags "STYLE=\"habit\""
               ((org-agenda-todo-ignore-with-date nil)
                (org-agenda-todo-ignore-scheduled nil)
                (org-agenda-todo-ignore-deadlines nil)
                (org-agenda-overriding-header "Habits")))
              ("#" "Stuck Projects" tags-todo "LEVEL=2-REFILE|LEVEL=1+REFILE/!-DONE-CANCELLED"
               ((org-agenda-skip-function 'bh/skip-non-stuck-projects)
                (org-agenda-overriding-header "Stuck Projects")))
              ("c" "Select default clocking task" tags "LEVEL=2-REFILE"
               ((org-agenda-skip-function
                 '(org-agenda-skip-subtree-if 'notregexp "^\\*\\* Organization"))
                (org-agenda-overriding-header "Set default clocking task with C-u C-u I")))
              ("b" "Backlog items, not process related" tags "BACKLOG-PROCESS-CANCELLED"
               ((org-agenda-overriding-header "Non-process backlog")
                (org-tags-exclude-from-inheritance '("BACKLOG"))))
              ("B" "Backlog items" tags "BACKLOG-CANCELLED"
               ((org-agenda-overriding-header "All backlog items")
                (org-tags-exclude-from-inheritance '("BACKLOG"))))
              ("R" "Ready items" tags "READY"
               ((org-agenda-overriding-header "Ready!")
                (org-tags-exclude-from-inheritance '("READY"))))
              ("I" "Items in progress (worked on and to test)" tags "INPROGRESS-CANCELLED|TEST-CANCELLED"
               ((org-agenda-overriding-header "Items in progress (worked on and to test)")
                (org-tags-exclude-from-inheritance '("INPROGRESS" "TEST")))))))

;;
;; Resume clocking tasks when emacs is restarted
(org-clock-persistence-insinuate)
;;
;; Yes it's long... but more is better ;)
(setq org-clock-history-length 28)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change task state to NEXT when clocking in
(setq org-clock-in-switch-to-state (quote bh/clock-in-to-next))
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK" "CLOCK")))
;; Save clock data in the CLOCK drawer and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer "CLOCK")
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist (quote history))
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

(setq bh/keep-clock-running nil)

(defun bh/clock-in ()
  (interactive)
  (setq bh/keep-clock-running t)
  (if (marker-buffer org-clock-default-task)
      (unless (org-clock-is-active)
        (bh/clock-in-default-task))
    (unless (marker-buffer org-clock-default-task)
      (org-agenda nil "c"))))

(defun bh/clock-out ()
  (interactive)
  (setq bh/keep-clock-running nil)
  (when (org-clock-is-active)
    (org-clock-out)))

(defun bh/clock-in-default-task ()
  (save-excursion
    (org-with-point-at org-clock-default-task
      (org-clock-in))))

(defun bh/clock-out-maybe ()
  (when (and bh/keep-clock-running (not org-clock-clocking-in) (marker-buffer org-clock-default-task))
    (bh/clock-in-default-task)))

(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

(defun bh/clock-in-last-task ()
  "Clock in the interrupted task if there is one"
  (interactive)
  (let ((clock-in-to-task (if (org-clock-is-active)
                              (setq clock-in-to-task (cadr org-clock-history))
                            (setq clock-in-to-task (car org-clock-history)))))
    (org-with-point-at clock-in-to-task
      (org-clock-in nil))))

(setq org-clock-out-remove-zero-time-clocks t)

;;;;;;;;;; Effort ;;;;;;;;;;

;; Agenda log mode items to display (clock time only by default)
(setq org-agenda-log-mode-items (quote (clock)))
; global Effort estimate values
(setq org-global-properties (quote (("Effort_ALL" . "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00"))))

;;;;;;;;;; Highlighting ;;;;;;;;;;

;; The following custom-set-faces create the highlights
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "cyan"))))
 '(hl-line ((t (:inherit highlight :background "darkseagreen2")))))

; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

(setq org-startup-indented t)

;;;;;;;;;; Tags ;;;;;;;;;;

; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@office" . ?o)
                            ("@home" . ?h)
                            (:endgroup)
                            ("PHONE" . ?P)
                            ("WAITING" . ?w)
                            ("HOME" . ?H)
                            ("ORG" . ?O)
                            ("MARK" . ?M)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?C))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)


;;;;;;;;;; Agenda view ;;;;;;;;;;

;; Keep tasks with dates off the global todo lists
(setq org-agenda-todo-ignore-with-date nil)

;; Allow deadlines which are due soon to appear on the global todo lists
(setq org-agenda-todo-ignore-deadlines (quote far))

;; Keep tasks scheduled in the future off the global todo lists
(setq org-agenda-todo-ignore-scheduled (quote future))

;; Remove completed deadline tasks from the agenda view
(setq org-agenda-skip-deadline-if-done t)

;; Remove completed scheduled tasks from the agenda view
(setq org-agenda-skip-scheduled-if-done t)

;; Remove completed items from search results
(setq org-agenda-skip-timestamp-if-done t)

;;;;;;;;;; Git ;;;;;;;;;;

; git-sync runs on the hour, so save before
(run-at-time "00:59" 3600 'org-save-all-org-buffers)

(provide 'noroute-org)
