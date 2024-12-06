;; break text at 80 chars
(set-fill-column 80) ;; change dynamicly: C-x f
(add-hook 'org-mode-hook #'(lambda () (auto-fill-mode 1)))

(setq org-startup-with-inline-images t)

(defun jneidel/insert-org-list-item ()
  "Insert a new item at the same level as the current list item."
  (interactive)
  (if (org-table-check-inside-data-field t)
        (evil-next-line)
        (let* ((context (org-element-lineage (org-element-context) '(item) t))
               (bullet (when context (org-element-property :bullet context)))
               (indent (if bullet
                         (make-string (org-get-indentation) ?\s)
                         "")))
          (if bullet
            (progn
              (end-of-line)
              (insert "\n" indent bullet "")
              (org-ctrl-c-ctrl-c) ;; fix ol
              (evil-insert-state))
            (progn
              (end-of-line)
              (insert "\n- " )
              (evil-insert-state))))))

(defun jneidel/insert-org-list-item-or-copy-down-table ()
  "Insert a new item at the same level as the current list item.
  If in a table, copy down values."
  (interactive)
  (if (org-table-check-inside-data-field t)
    (org-table-copy-down 1) ;; default S-RET functionality
    (jneidel/insert-org-list-item)))

;; https://orgmode.org/manual/Checkboxes.html
(defun jneidel/org-set-checkbox-in-progress ()
  (interactive)
  (org-toggle-checkbox '(16)))

(defun jneidel/insert-latest-chart-screenshot ()
  "Insert the latest chart screenshot."
  (interactive)
  (let ((latest_chart (string-trim (shell-command-to-string "screenshot-chart get_latest"))))
    (if (not (string-empty-p latest_chart))
      (insert (format "[[file:%s]]\n" latest_chart))
      (message "Take a chart screenshot first."))))

;; recalc formulas
;; TODO: enhance by checking if output is "Not a table" and running the command
;; of C-c C-c (recalc if on TBLFM)

(with-eval-after-load 'org
                      (define-key org-mode-map (kbd "C-c C-+") 'org-table-iterate)
                      )
(evil-define-key "normal" org-mode-map
                 (kbd "g i") #'org-toggle-inline-images
                 (kbd "g l") #'org-insert-link
                 (kbd "g a") #'jneidel/insert-latest-chart-screenshot
                 (kbd "TAB") #'org-cycle
                 (kbd "M-j") #'org-metadown
                 (kbd "M-k") #'org-metaup
                 (kbd "M-h") #'org-metaleft
                 (kbd "M-l") #'org-metaright
                 (kbd "RET") #'jneidel/insert-org-list-item ;; RET in cal doesn't work anyway
                 (kbd "<S-return>") #'jneidel/insert-org-list-item-or-copy-down-table
                 (kbd "C-c a") #'org-table-recalculate
                 (kbd "g r") #'org-table-recalculate
                 (kbd "g t p") #'jneidel/org-set-checkbox-in-progress
                 )
(evil-define-key "insert" org-mode-map
                 (kbd "<S-return>") #'jneidel/insert-org-list-item-or-copy-down-table
                 (kbd "C-c a") #'org-table-recalculate
                 (kbd "<leader> d") #'org-ctrl-c-ctrl-c ;; toggle done/undone
                 )
;;; evil-define-key does not need with-eval-after-load and can assign multiple at once

;; Outline headings
(with-eval-after-load 'outline
                      (set-face-attribute 'outline-1 nil
                                          :inherit 'font-lock-function-name-face
                                          :foreground "#EA3D54")
                      (set-face-attribute 'outline-4 nil
                                          :inherit 'font-lock-comment-face
                                          :foreground "orange")
                      (set-face-attribute 'outline-6 nil
                                          :inherit 'font-lock-constant-face
                                          :foreground "green"
                                          :weight 'normal)
                      (set-face-attribute 'outline-8 nil
                                          :inherit 'font-lock-string-face
                                          :foreground "purple")
                      )

(require 'org-tempo) ;; for <q TAB and more completions

(provide 'init-org)
;; TODO: checkout other 'init-org
