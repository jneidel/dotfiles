; https://www.masteringemacs.org/article/running-shells-in-emacs-overview

; https://github.com/akermu/emacs-libvterm
(use-package vterm)
;; evil mode intercepts ESC -> disable evil
;; vterm mode intercepts Meta and Shift -> provide quick way to get out
(with-eval-after-load 'evil
  (evil-set-initial-state 'vterm-mode 'emacs))

; enter
(general-define-key "M-t" 'vterm)
; exit
(general-define-key
 :keymaps 'vterm-mode-map
 "M-t" 'bury-buffer
 "M-F" (lambda () (interactive) (bury-buffer) (fzf)))

; better commands for copy and paste
(general-define-key
 :keymaps 'vterm-mode-map
 "C-v" 'yank)

(provide 'init-terminal)
