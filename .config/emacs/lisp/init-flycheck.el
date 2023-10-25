;;; syntax checking

(use-package flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; list of backends by language
;;  https://www.flycheck.org/en/latest/languages.html#flycheck-languages

;; disable annoying reminders to have certain comments in your elisp files
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))

;;; C-c ! v - debug menu for major mode

(provide 'init-flycheck)
