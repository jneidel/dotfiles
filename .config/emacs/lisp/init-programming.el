;; global programming configuration

;; Turn on syntax highlighting whenever possible.
(global-font-lock-mode t)

(global-hl-line-mode t)

;; highlight matching pairs of parentheses
(show-paren-mode t)
(setq show-paren-delay 0.0)

;; Treat CamelCaseSubWords as separate words in every programming mode
(add-hook 'prog-mode-hook 'subword-mode)

;; https://github.com/jacktasia/dumb-jump
(use-package dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)

;; 2 spaces as default indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; overwrite e.g. indentation based on local editorconfig
(use-package editorconfig
             :config
             (editorconfig-mode 1)
             :diminish editorconfig-mode)

(provide 'init-programming)
