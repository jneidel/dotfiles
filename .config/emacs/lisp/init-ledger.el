(use-package hledger-mode
             :config
             (use-package flycheck-hledger))

;; use hledger-mode on journal files
(add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))

(setq ledger-binary-path "hledger"
      ledger-highlight-xact-under-point nil
      ledger-use-iso-dates nil
      ledger-mode-should-check-version nil)

(with-eval-after-load 'hledger-mode
  (setq tab-width 2)
  (evil-define-key "normal" ledger-mode-map (kbd "RET") 'open-line)
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-copy-env "LEDGER_FILE")))

(add-hook 'ledger-mode-hook 'goto-address-prog-mode)

;; no rupee after transaction
;; src: https://github.com/narendraj9/hledger-mode/issues/39
(defun hledger-indent-account-line* ()
  "Called when the line to indent is an account listing line."
  (cond
   ((hledger-cur-line-matchesp (concat hledger-whitespace-account-regex "\\s-*" hledger-amount-value-regex))
    (insert "    "))
   ((hledger-expecting-rupeep) (insert "    "))
   (t (indent-line-to tab-width))))
(advice-add 'hledger-indent-account-line :override #'hledger-indent-account-line*)

(provide 'init-ledger)
