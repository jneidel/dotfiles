(use-package general) ;; https://github.com/noctuid/general.el#evil-examples
(use-package hydra) ;; https://github.com/abo-abo/hydra

;; <leader> and <localleader>
;;;; use as (evil-define-key 'normal 'global (kbd "<leader>fs") 'save-buffer)
(evil-set-leader nil (kbd "C-SPC"))
(evil-set-leader 'normal (kbd "SPC"))
;; local leader
(evil-set-leader 'normal "," t)

(defun jneidel/jump-to-placeholder ()
  "Jump to the next <++>, replace it and go into insert mode."
  (interactive)
  (let ((placeholder-found
          (search-forward "<++>" nil t)))
    (if placeholder-found
      (progn
        (goto-char (match-beginning 0))
        (delete-char 4)
        (evil-insert-state))
      (message "No <++> found"))))

(general-define-key
  :states 'normal
  "<localleader>," 'jneidel/jump-to-placeholder)

;; adjust text size
(defhydra text-size-hydra (global-map "C-+") "Adjust text size"
          ("+" text-scale-increase "bigger")
          ("-" text-scale-decrease "smaller")
          ("=" (text-scale-set 0) "set default")
          ("d" (text-scale-set 0) "set default")
          ("f" (text-scale-set 6) "set far"))

(global-set-key (kbd "C-ö") (lambda () (interactive)(split-window-right) (other-window 1)))
(global-set-key (kbd "C--") (lambda () (interactive)(split-window-below) (other-window 1)))

;; move between windows and frames
(require 'move-border) ;; https://www.emacswiki.org/emacs/WindMove
(general-define-key
  :states 'normal
  "H" 'windmove-left
  "L" 'windmove-right
  "K" 'windmove-up
  "J" 'windmove-down
  "C-S-j" 'evil-join ; reassign
  ;; resize windows and frames
  "M-H" 'move-border-left
  "M-L" 'move-border-right
  "M-K" 'move-border-up
  "M-J" 'move-border-down
  )

(provide 'init-bindings)
