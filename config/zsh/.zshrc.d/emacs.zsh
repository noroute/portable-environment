# Open file(s) in terminal Emacs
alias et="emacsclient -c"

# Open file(s) in GUI Emacs.app frame
e() {
  open -a Emacs.app "$@"
}
