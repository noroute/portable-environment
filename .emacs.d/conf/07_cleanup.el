; Cleanup functions 
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))
 
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
 
(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun pretty-lambdas ()
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))
