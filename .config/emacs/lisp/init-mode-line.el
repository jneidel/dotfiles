(use-package spaceline)
(require 'spaceline)
(require 'spaceline-config)

; configure segments
(defface grey-on-grey '((t ( :foreground "dim grey" :background "#1c1c1c")))
         "Grey on default background")
(defface white-on-grey '((t ( :foreground "floral white" :background "#1c1c1c")))
         "White on default background")

(
 spaceline-define-segment flycheck-status "Custom flycheck status"
 (let* ((text
          (pcase flycheck-last-status-change
                 (`finished (if flycheck-current-errors
                              (let ((count (let-alist (flycheck-count-errors flycheck-current-errors)
                                                      (+ (or .warning 0) (or .error 0)))))
                                (format "✖ %s Issue%s" count (if (eq 1 count) "" "s")))
                              "         ")) ;; No issues
                 (`running     "         ")
                 (`no-checker  "⚠ No Checker")
                 (`not-checked "         ") ;; Disabled
                 (`errored     "⚠ Error")
                 (`interrupted "⛔ Interrupted")
                 (`suspicious  "")))
        (face-formatting (cond
                           ((string-match "⚠" text) `(:height 0.9 :inherit))
                           ((string-match "✖ [0-9]" text) `(:height 0.9 :background "#1c1c1c" :foreground "#d70000"))
                           ((string-match "✖ Disabled" text) `(:height 0.9 :inherit))
                           (t '(:height 0.9 :inherit)))))
   (propertize (format "%s" text)
               'face face-formatting
               'help-echo "Show Flycheck Errors"
               'display '(raise 0.1)
               'mouse-face '(:box 1)
               'local-map (make-mode-line-mouse-map 'mouse-1 (lambda () (interactive) (flycheck-list-errors)))))
 :when active)

(defface myred '((t ( :foreground "#d70000" :background "#d70000"))) "Red for hud")
(spaceline-define-segment red-hud
                          "A HUD that shows which part of the buffer is currently visible."
                          (powerline-hud 'myred 'grey-on-grey)
                          :tight t)

(spaceline-compile
  "jneidel"
  ; left side
  '(
    ((evil-state buffer-modified buffer-id) ; TODO: include file path in buffer-id
     :face 'white-on-grey
     :separator " "
     :tight-left t
     :priority 100)
    (major-mode
      :face 'grey-on-grey
      :priority 79)
    ((flycheck-status)
     :face 'grey-on-grey
     :priority 89)
    (process
      :face 'grey-on-grey
      :when active)
    ;; (version-control :when active
    ;;                  :priority 78)
    (org-clock
      :face 'grey-on-grey
      :when active)
    )
  ; right side
  '(
    (selection-info
      :face 'grey-on-grey
      :priority 95)
    (minor-modes
      :face 'grey-on-grey
      :priority 9
      :separator " ")
    ((remote-host)
     :face 'grey-on-grey
     :priority 98)
    (global
      :face 'grey-on-grey
      :when active)
    (red-hud
      :face 'grey-on-grey
      :priority 99)
    )
  )
;; sources
;;; https://github.com/TheBB/spaceline
;;; https://github.com/domtronn/all-the-icons.el/wiki/Spaceline

;; activate
(setq-default mode-line-format '("%e" (:eval (spaceline-ml-jneidel))))

; stop mode line from flashing on loss of focus (rofi, volume, brightness, etc.)
;; (set-face-attribute 'mode-line nil
;;                     :box '(:line-width (1 . 1) :color "#1c1c1c" :style none))
;; (set-face-attribute 'mode-line-inactive nil
;;                     :box '(:line-width (1 . 1) :color "#1c1c1c" :style none) :inherit 'mode-line)
(set-face-attribute 'powerline-active0 nil
                    :background "#1c1c1c"
                    :inherit 'mode-line)
(set-face-attribute 'powerline-active1 nil
                    :background "#1c1c1c"
                    :inherit 'mode-line)
(set-face-attribute 'powerline-active2 nil
                    :background "#1c1c1c"
                    :inherit 'mode-line)
(set-face-attribute 'powerline-inactive0 nil
                    :background "#1c1c1c"
                    :inherit 'mode-line-inactive)
(set-face-attribute 'powerline-inactive1 nil
                    :background "#1c1c1c"
                    :inherit 'mode-line-inactive)
(set-face-attribute 'powerline-inactive2 nil
                    :background "#1c1c1c"
                    :inherit 'mode-line-inactive)

(provide 'init-mode-line)
