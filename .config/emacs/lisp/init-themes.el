(load-theme 'an-old-hope t)

;; Don't prompt to confirm theme safety
(setq custom-safe-themes t)

;; Toggle between light and dark
(defun light-mode()
  "Activate the light color theme."
  (interactive)
  (use-package modus-themes
               :config
               (load-theme 'modus-operandi-tritanopia)))

(defun dark-mode()
  "Activate the dark color theme."
  (interactive)
  (load-theme 'an-old-hope))

(provide 'init-themes)
