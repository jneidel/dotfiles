(use-package general) ;; https://github.com/noctuid/general.el#evil-examples
(use-package hydra) ;; https://github.com/abo-abo/hydra

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
  ;; resize windows and frames
  "M-H" 'move-border-left
  "M-L" 'move-border-right
  "M-K" 'move-border-up
  "M-J" 'move-border-down
  )

(provide 'init-bindings)
