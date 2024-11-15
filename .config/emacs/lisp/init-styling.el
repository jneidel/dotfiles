(set-frame-font "ComicCodeLigatures Nerd Font 13" nil t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-face-attribute 'underline nil
                    :inherit 'default
                    :underline t)

(setq blink-cursor-blinks 10
      blink-cursor-mode nil)

(provide 'init-styling)
