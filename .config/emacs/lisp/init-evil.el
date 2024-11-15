;;; package --- Vim bindings, Evil mode configuration

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode t))

; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(diminish 'evil-collection-unimpaired-mode)

(use-package evil-commentary
    :after evil
    :config
    (evil-commentary-mode)
    :diminish)

;; evil states in the mode-line
(defface evil-normal-state-tag-face
         '((t (
               :background "#005fd7" ; blue
               :foreground "#1c1c1c"
               :box (:line-width 2 :color "#005fd7"))))
         "Face for the evil NORMAL state tag.")
(defface evil-insert-state-tag-face
         '((t (
               :background "#00ff5f" ; green
               :foreground "#1c1c1c"
               :box (:line-width 2 :color "#00ff5f"))))
         "Face for the evil INSERT state tag.")
(defface evil-visual-state-tag-face
         '((t (
               :background "#ff5f00" ; orange
               :foreground "#1c1c1c"
               :box (:line-width 2 :color "#ff5f00"))))
         "Face for the evil VISUAL state tag.")
(defface evil-replace-state-tag-face
         '((t (
               :background "#d70000" ; orange
               :foreground "#1c1c1c"
               :box (:line-width 2 :color "#d70000"))))
         "Face for the evil REPLACE state tag.")
(setq evil-normal-state-tag (propertize "\u200b NORMAL \u200b" 'face 'evil-normal-state-tag-face))
(setq evil-insert-state-tag (propertize "\u200b INSERT \u200b" 'face 'evil-insert-state-tag-face))
(setq evil-visual-state-tag (propertize "\u200b VISUAL \u200b" 'face 'evil-visual-state-tag-face))
(setq evil-replace-state-tag (propertize "\u200b REPLACE \u200b" 'face 'evil-replace-state-tag-face))
(setq evil-motion-state-tag (propertize "\u200b MOTION \u200b" 'face 'evil-normal-state-tag-face))
(setq evil-operator-state-tag (propertize "\u200b OPRTOR \u200b" 'face 'evil-normal-state-tag-face))
(setq evil-emacs-state-tag "EMACS")

;; <leader> and <localleader>
;;;; use as (evil-define-key 'normal 'global (kbd "<leader>fs") 'save-buffer)
(evil-set-leader nil (kbd "C-SPC"))
(evil-set-leader 'normal (kbd "SPC"))
;; local leader
(evil-set-leader 'normal "," t)

;; TODO: fix and replace evil-commentary
;; (use-package smart-comment
;;   :config
;;   (evil-global-set-key "normal" (kbd "gc") 'smart-comment))

;; fix RET being overwritten in org-mode (and maybe others)
;; (with-eval-after-load 'evil
;;                       (evil-define-key 'normal org-mode-map (kbd "RET") nil)
;;                       (dolist (map (list evil-normal-state-map
;;                                          evil-motion-state-map))
;;                         (define-key map (kbd "RET") nil)))

(provide 'init-evil)
