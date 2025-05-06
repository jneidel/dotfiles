(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-use-package)

;; make it feel like home
(require 'init-evil)
(require 'init-themes)
(require 'init-mode-line)
(require 'init-styling)
(require 'init-bindings)
(require 'init-tabs)
(require 'init-org-modern)

;; make it useful
;;; general purpose
(require 'init-org)
(require 'init-fzf)
(require 'init-flycheck)
(require 'init-completion)

;;; programming
(require 'init-lisp)
(require 'init-programming)
(require 'init-line-numbers)

;;; apps
(require 'init-ledger)
(require 'init-terminal)

;; make it work as intended
(require 'init-automatic-fs-read-write)
(require 'init-backups)
(require 'init-misc-fixes)

(server-start)

; code inspiration from https://github.com/purcell/emacs.d
