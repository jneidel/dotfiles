;;; init-ledger.el --- Support for the ledger CLI accounting tool -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; TODO: port this to ledger-mode
;; https://hledger.org/editors.html

(when (maybe-require-package 'hledger-mode)
  (when (maybe-require-package 'flycheck-hledger)
    (with-eval-after-load 'flycheck
      (with-eval-after-load 'hledger-mode
        (require 'flycheck-hledger))))

  ;; also open on hledger journal files
  (add-to-list 'auto-mode-alist '("\\.journal\\'" . hledger-mode))

  (with-eval-after-load 'hledger-mode
    (evil-define-key "normal" ledger-mode-map (kbd "RET") 'open-line))

  (setq ledger-highlight-xact-under-point nil
        ledger-use-iso-dates nil
        ledger-mode-should-check-version nil)

  (with-eval-after-load 'hledger-mode
    (setq tab-width 2) 
    (when (memq window-system '(mac ns))
      (exec-path-from-shell-copy-env "LEDGER_FILE")))

  (add-hook 'ledger-mode-hook 'goto-address-prog-mode))

;; (add-hook 'ledger-mode-hook
;;           (lambda ()
;;             (setq-local tab-always-indent 'complete)
;;             (setq-local completion-cycle-threshold t)
;;             (setq-local ledger-complete-in-steps t)))

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

;; mark + M-x align, not great
;; https://github.com/narendraj9/hledger-mode/issues/28
;; leder-mode has this built-in
;; (add-to-list 'align-rules-list
;;              `(hledger-accounts
;;                (regexp . ,(rx (+ space)
;;                               (+? anything)
;;                               (group-n 1 space (+ space)
;;                                        (? ?-)
;;                                        (+ digit)
;;                                        (? ?.)
;;                                        (* digit))))
;;                (group . 1)
;;                (spacing . 2)
;;                (justify . t)
;;                (separate . entire)
               ;; (modes . '(hledger-mode))))

(provide 'init-ledger)
