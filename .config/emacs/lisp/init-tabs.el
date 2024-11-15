(setq tab-bar-show 1
      tab-bar-auto-width nil
      tab-bar-auto-width-max '(220 30)
      tab-bar-close-button-show nil
      tab-bar-format '(tab-bar-format-history tab-bar-format-tabs tab-bar-separator))
(tab-bar-mode t)

(set-face-attribute 'tab-bar nil
                    :background "#1c1c1c"
                    :slant 'italic
                    :height 0.85)
(set-face-attribute 'tab-bar-tab nil
                    :inherit 'tab-bar
                    :foreground "#d70000"
                    :box nil)
(set-face-attribute 'tab-bar-tab-inactive nil
                    :inherit 'tab-bar-tab
                    :foreground "dim grey"
                    :background 'unspecified)

(provide 'init-tabs)
