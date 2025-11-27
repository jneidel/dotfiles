(define-configuration browser
  ((theme theme:+dark-theme+)))

(define-configuration browser
  ((theme theme:+light-theme+)))

(define-configuration (web-buffer)
  ((default-modes (pushnew 'nyxt/mode/blocker:blocker-mode %slot-value%))))
