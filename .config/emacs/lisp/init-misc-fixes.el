;; Makes buffer management more elegant when working with "temporary" buffers
;; https://github.com/emacsmirror/fullframe
(use-package fullframe)

;; always follow symlinks
(setq vc-follow-symlinks t)

;; save customize changes in specific file
(setq custom-file (locate-user-emacs-file "lisp/customize.el"))
(load custom-file)

;; Allow 20MB of memory (instead of 0.76MB) before calling garbage collection.
;; This means GC runs less often, which speeds up some operations.
(setq gc-cons-threshold 20000000)

;; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; When saving a file that starts with `#!', make it executable.
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; single space after a period
(setq sentence-end-double-space nil)

;; offer to create parent directories on save
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; (defun sensible-defaults/apply-changes-to-highlighted-region ()
;;   "Turn on transient-mark-mode."
(transient-mark-mode t)

;; If some text is selected, and you type some text, delete the
;; selected text and start inserting your typed text.
(delete-selection-mode t)

;; ensure that files end with newline
(setq require-final-newline t)

;; quiet startup
;; Don't present the usual startup message, and clear the scratch buffer.
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Make dired file sizes human readable
(setq-default dired-listing-switches "-alh")

;; audible or visible bell
(setq visible-bell nil)

;; default line length
(setq-default fill-column 80)

;; When middle-clicking the mouse to yank from the clipboard,
;; insert the text where point is, not where the mouse cursor is.
(setq mouse-yank-at-point t)

;; Yes-No prompts only ask for y/n
(setopt use-short-answers t)
(fset 'yes-or-no-p 'y-or-n-p)

(defun jneidel-Y-or-n-p (prompt)
    "Prompt user for (Y/n)."
    (if (string= "n"
                 (downcase
                   (read-from-minibuffer
                     (concat prompt "(Y/n) "))))
      nil
      t))
(defalias 'y-or-n-p 'jneidel-Y-or-n-p)

;; includes some of https://github.com/hrs/sensible-defaults.el/tree/main
(provide 'init-misc-fixes)
