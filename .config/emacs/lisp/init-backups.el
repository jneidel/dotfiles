;; New location for backups.
(setq backup-directory-alist '(("." . "~/.local/share/emacs/backups")))

;; Silently delete execess backup versions
(setq delete-old-versions t)

; Don't delink hardlinks
(setq backup-by-copying t)

; how many of the newest versions to keep
(setq kept-new-versions 50)

;; Only keep the last 200 backups of a file.
(setq kept-old-versions 200)

;; Even version controlled files get to be backed up.
(setq vc-make-backup-files t)

;; Use version numbers for backup files.
(setq version-control t)

(setq confirm-kill-processes nil
      create-lockfiles nil)

;; Make Emacs backup everytime I save
(defun my/force-backup-of-buffer ()
  "Lie to Emacs, telling it the curent buffer has yet to be backed up."
  (setq buffer-backed-up nil))
(add-hook 'before-save-hook  'my/force-backup-of-buffer)

(provide 'init-backups)
