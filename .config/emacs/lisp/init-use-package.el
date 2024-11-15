(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; use-package
(setq use-package-always-ensure t) ;; default use-package only lazy load package if it exists, this also downloads a package if it is not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
; use-package syntax
;; :init - run code before import
;; :config - run code after import
;; :diminish mode - hide mode from modeline
(use-package diminish) ;; https://github.com/emacsmirror/diminish

;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(setq package-user-dir
      (expand-file-name (format "packages-%s.%s" emacs-major-version emacs-minor-version)
                        "~/.local/share/emacs"))

(setq package-enable-at-startup nil)
(package-initialize)

;; packages not available from repositories are in lib
(add-to-list 'load-path (expand-file-name "lib" user-emacs-directory))

(provide 'init-use-package)
