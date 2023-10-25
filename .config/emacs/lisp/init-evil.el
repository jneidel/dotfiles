;;; package --- Vim bindings, Evil mode configuration

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode t))

; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-commentary
    :after evil
    :config
    (evil-commentary-mode))

;; TODO: fix and replace evil-commentary
;; (use-package smart-comment
;;   :config
;;   (evil-global-set-key "normal" (kbd "gc") 'smart-comment))

(provide 'init-evil)
