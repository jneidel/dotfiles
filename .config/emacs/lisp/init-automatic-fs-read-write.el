;; discard buffer changes on file change
(global-auto-revert-mode t)

;; update file on buffer change
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;; Autosave when idle for 30sec or after 300 input events
(setq auto-save-timeout 30
      auto-save-interval 300)

(provide 'init-automatic-fs-read-write)
