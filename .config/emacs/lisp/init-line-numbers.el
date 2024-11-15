(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(setq display-line-numbers-type 'relative)

(set-face-attribute 'line-number nil
                    :background "#1c1c1c"
                    :foreground "dim gray")
(set-face-attribute 'line-number-current-line nil
                    :inherit 'line-number
                    :background "#ea3d54"
                    :foreground "#1c1c1c")

(provide 'init-line-numbers)
