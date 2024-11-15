(use-package org-modern)

(with-eval-after-load 'org (global-org-modern-mode))
(with-eval-after-load 'org (display-line-numbers-mode nil))

;; disable headings styles
(setq org-modern-star nil)

;; adjust list tasks styles
(setq org-modern-checkbox
      '((88 . "") (45 . "") (32 . "×") (95 . "")))

(set-face-attribute 'org-modern-date-active nil
                    :background "gray20"
                    :foreground "white"
                    :height 1.0
                    :inherit 'org-modern-label)
; :inverse-video - inverts back/fore colors
;    is needed so labels look consistent, when cursor is on the same line
(set-face-attribute 'org-modern-done nil
                    :background "#1c1c1c"
                    :foreground "forest green"
                    :inverse-video t
                    :weight 'semi-bold
                    :inherit 'org-modern-label)
(set-face-attribute 'org-modern-todo nil
                    :background "#1c1c1c"
                    :foreground "#d70000"
                    :inverse-video t
                    :weight 'semi-bold
                    :inherit 'org-modern-label)

(provide 'init-org-modern)
