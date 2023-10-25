;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-

(load-theme 'an-old-hope t)

;; Toggle between light and dark
(defun light ()
  "Activate a light color theme."
  (interactive)
  (setq custom-enabled-themes '(leuven))
  (reapply-themes))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (setq custom-enabled-themes '(an-old-hope))
  (reapply-themes))

;; (when (maybe-require-package 'dimmer)
;;   (setq-default dimmer-fraction 0.15)
;;   (add-hook 'after-init-hook 'dimmer-mode)
;;   (with-eval-after-load 'dimmer
;;     ;; TODO: file upstream as a PR
;;     (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all))))
;;   (with-eval-after-load 'dimmer
;;     ;; Don't dim in terminal windows. Even with 256 colours it can
;;     ;; lead to poor contrast.  Better would be to vary dimmer-fraction
;;     ;; according to frame type.
;;     (defun sanityinc/display-non-graphic-p ()
;;       (not (display-graphic-p)))
;;     (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)))

(provide 'init-themes)
