;; noroute-puppet.el -- Puppet

(require 'req-package)
(req-package 'puppet
  :mode "\\.pp"
)

(provide 'init-puppet)
