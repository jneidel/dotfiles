;;; Startup
;;; package list
(require 'package)
(setq package-archives
      '(("org" . "http://orgmode.org/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "http://stable.melpa.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))

;;; BOOTSTRAP USE-PACKAGE
;; (package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(global-set-key (kbd "C-ö") (lambda () (interactive)(split-window-right) (other-window 1)))
(global-set-key (kbd "C-ü") (lambda () (interactive)(split-window-below) (other-window 1)))

(use-package dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
;; https://github.com/jacktasia/dumb-jump

(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode t)

(set-frame-font "ComicCodeLigatures Nerd Font 13" nil t)

(server-start)

(auto-fill-mode t)
(set-fill-column 80) ;; dynamic: C-x f

(fido-mode t)

;; manage backups all in one location
(setq backup-directory-alist '(("." . "~/.local/share/emacs/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )

;; to enable: M-x tool-bar-mode
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-blinks 10)
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   '("ae24c19a63fab7f6f750032c9324623c6c7e4dab651cacd95278ba3099f2fe56" default))
 '(delete-selection-mode t)
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(ledger-binary-path "hledger")
 '(package-selected-packages
   '(flycheck-hledger hledger-mode gnu-elpa-keyring-update fullframe seq flycheck-ledger ledger-mode))
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:background "#1c1c1c" :foreground "dim gray"))))
 '(line-number-current-line ((t (:inherit line-number :background "#ea3d54" :foreground "#1c1c1c"))))
 '(outline-1 ((t (:inherit font-lock-function-name-face :foreground "#EA3D54"))))
 '(outline-4 ((t (:inherit font-lock-comment-face :foreground "orange"))))
 '(outline-6 ((t (:inherit font-lock-constant-face :foreground "green" :weight normal))))
 '(outline-8 ((t (:inherit font-lock-string-face :foreground "purple"))))
 '(underline ((t (:inherit default :underline t)))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp/disabled" user-emacs-directory))

(setq-default indent-tabs-mode nil)
(setq tab-width 2)

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;; 
;; ;; Adjust garbage collection thresholds during startup, and thereafter
;;
;; (let ((normal-gc-cons-threshold (* 20 1024 1024))
;;       (init-gc-cons-threshold (* 128 1024 1024)))

;;   (add-hook 'emacs-startup-hook
;;             (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
;;
;; 
;; ;; Bootstrap config
;;
;; (setq custom-file (locate-user-emacs-file "custom.el"))
;; (require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
(require 'init-elpa)      ;; Machinery for installing required packages
;; (require 'init-exec-path) ;; Set up $PATH

(require 'init-themes)
(require 'init-evil)
(require 'init-flycheck)
(require 'init-ledger)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; does this work?
;; don't wanna toggle it since, but be explicit about turning it on
;; wrap text after 80 chars
(add-hook 'org-mode-hook '(auto-fill-mode t))
;; recalc formulas
;; TODO: enhance by checking if output is "Not a table" and running the command
;; of C-c C-c (recalc if on TBLFM)
(with-eval-after-load "org"
    (define-key org-mode-map (kbd "C-c C-+") 'org-table-iterate))

(require 'move-border)

(defvar jneidel-keys-mode-map
  (let ((map (make-sparse-keymap)))
    ;; move between windows with vim keys
    (evil-define-key "normal" map (kbd "M-h") 'windmove-left)
    (evil-define-key "normal" map (kbd "M-l") 'windmove-right)
    (evil-define-key "normal" map (kbd "M-k") 'windmove-up)
    (evil-define-key "normal" map (kbd "M-j") 'windmove-down)
    ;;; also for frames: https://www.emacswiki.org/emacs/WindMove
    ;; resize windows
    (evil-define-key "normal" map "\M-\S-h" 'move-border-left)
    (evil-define-key "normal" map "\M-\S-l" 'move-border-right)
    (evil-define-key "normal" map "\M-\S-j" 'move-border-down)
    (evil-define-key "normal" map "\M-\S-k" 'move-border-up)
    map)
  "Keymap for jneidel-keys-mode.")
(define-minor-mode jneidel-keys-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :keymap 'jneidel-keys-mode-map)
(jneidel-keys-mode 1)
;; src: https://emacs.stackexchange.com/a/27943

;; TODO: disable automatic line breaking to get this all into one big line so it works
(setenv "_DEFAULT_COMMAND" "rg --ignore --hidden --files
--type-add='exclude:*.{mp3,png,jpg,JPG,jpeg,pdf,mkv,mp4,avi,zip,ods,xlsx,m3u,url,aac,mpc,epub,sql,ydb}'
--type-not=exclude --glob='!.git/' --glob '!git/' --glob '!node_modules/' --glob
'!.cache' --glob '!vendor/' --glob '!teams-for-linux/' --glob '!.local/lib'
--glob '!.local/share/*/' --glob '!BraveSoftware/' --glob '!chromium' --glob
'!chrome/' --glob '!firefox/' --glob '!Signal' -g='!.ib-tws/' -g='!.java/'
-g='!.zcompcache' --glob '!tmp/' --glob='!ct/manga' --glob='!ct/comics'
--glob='!dotfiles/' -g='!coverage' -g='!dist/' -g='!build/' -g='!.gradle/' -g='!elpa'")

;; pkg: https://github.com/bling/fzf.el
(use-package fzf
  :config
  (setq
   fzf/args "--bind TAB:up,Shift-TAB:down -x --color dark --print-query --margin=1,0 --no-hscroll"
   fzf/position-bottom t
   fzf/window-height 10
   ))

;; ;; Allow users to provide an optional "init-preload-local.el"
;; ;; (require 'init-preload-local nil t)
;;
;; ;; Load configs for specific features and modes
;; (require-package 'diminish)
;; (maybe-require-package 'scratch)
;; (require-package 'command-log-mode)
;;
;; (require 'init-frame-hooks)
;; (require 'init-xterm)
;; ;; (require 'init-osx-keys)
;; (require 'init-gui-frames)
;; (require 'init-dired)
;; (require 'init-isearch)
;; (require 'init-grep)
;; (require 'init-uniquify)
;; (require 'init-ibuffer)
;; (require 'init-flymake)
;; (require 'init-eglot)
;;
;; (require 'init-recentf)
;; (require 'init-minibuffer)
;; (require 'init-hippie-expand)
;; (require 'init-corfu)
;; (require 'init-windows)
;; (require 'init-sessions)
;; (require 'init-mmm)
;;
;; (require 'init-editing-utils)
;; (require 'init-whitespace)
;;
;; (require 'init-vc)
;; (require 'init-darcs)
;; (require 'init-git)
;; (require 'init-github)
;;
;; (require 'init-projectile)
;;
;; (require 'init-compile)
;; (require 'init-crontab)
;; (require 'init-markdown)
;; ;; (require 'init-csv)
;; (require 'init-javascript)
;; (require 'init-php)
;; (require 'init-org)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-http)
;; ;; (require 'init-python)
;; (require 'init-sql)
;; ;; (require 'init-rust)
;; (require 'init-toml)
;; (require 'init-yaml)
;; (require 'init-docker)
;; ;; (maybe-require-package 'nginx-mode)
;;
;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; ;; (require 'init-clojure)
;; ;; (require 'init-clojure-cider)
;; (require 'init-common-lisp)
;;
;; (when *spell-check-support-enabled*
;;   (require 'init-spelling))
;;
;; (require 'init-misc)
;;
;; (require 'init-folding)
;; (require 'init-dash)
;;
;; ;; (require 'init-lua)
;;
;; ;; Extra packages which don't require any configuration
;;
;; ;; (require-package 'sudo-edit)
;; ;; (require-package 'gnuplot)
;; ;; (require-package 'htmlize)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (maybe-require-package 'dotenv-mode)
;; (maybe-require-package 'shfmt)
;;
;; ;; (when (maybe-require-package 'uptimes)
;; ;;   (setq-default uptimes-keep-count 200)
;; ;;   (add-hook 'after-init-hook (lambda () (require 'uptimes))))
;;
;; (when (fboundp 'global-eldoc-mode)
;;   (add-hook 'after-init-hook 'global-eldoc-mode))
;;
;; (require 'init-direnv)
;;
;; (when (and (require 'treesit nil t)
;;            (fboundp 'treesit-available-p)
;;            (treesit-available-p))
;;   (require 'init-treesitter))
;;
;; 
;;
;; ;; Allow access from emacsclient
;; (add-hook 'after-init-hook
;;           (lambda ()
;;             (require 'server)
;;             (unless (server-running-p)
;;               (server-start))))
;;
;; ;; Variables configured via the interactive 'customize' interface
;; (when (file-exists-p custom-file)
;;   (load custom-file))
;;
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; (require 'init-locales)
;;
;; ;; Allow users to provide an optional "init-local" containing personal settings
;; (require 'init-local nil t)
;;
;; (provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
