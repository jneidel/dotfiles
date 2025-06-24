;; https://github.com/bling/fzf.el
(use-package fzf)
(setq fzf/args "--bind TAB:up -x -e --color dark --print-query --margin=1,0 --no-hscroll"
      fzf/position-bottom t
      fzf/window-height 12)

(defun jneidel-fzf-directory (dir)
  "Starts a fzf session in the passed directory.
  Copy of 'fzf (uses $FZF_DEFAULT_COMMAND)."
  (interactive "P")
  (let ((fzf--target-validator (fzf--use-validator
                                 (function fzf--validate-filename))))
    (fzf--start (fzf--resolve-directory dir) #'fzf--action-find-file)))

(general-define-key
  "M-F" 'fzf
  "M-f" (lambda () (interactive) (jneidel-fzf-directory "~")))

(provide 'init-fzf)
