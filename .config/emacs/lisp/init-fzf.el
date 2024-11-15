;; TODO: disable automatic line breaking to get this all into one big line so it works
(setenv "_DEFAULT_COMMAND" "rg --ignore --hidden --files
        --type-add='exclude:*.{mp3,png,jpg,JPG,jpeg,pdf,mkv,mp4,avi,zip,ods,xlsx,m3u,url,aac,mpc,epub,sql,ydb}'
        --type-not=exclude --glob='!.git/' --glob '!git/' --glob '!node_modules/' --glob
        '!.cache' --glob '!vendor/' --glob '!teams-for-linux/' --glob '!.local/lib'
        --glob '!.local/share/*/' --glob '!BraveSoftware/' --glob '!chromium' --glob
        '!chrome/' --glob '!firefox/' --glob '!Signal' -g='!.ib-tws/' -g='!.java/'
        -g='!.zcompcache' --glob '!tmp/' --glob='!ct/manga' --glob='!ct/comics'
        --glob='!dotfiles/' -g='!coverage' -g='!dist/' -g='!build/' -g='!.gradle/' -g='!elpa'")

;; https://github.com/bling/fzf.el
(use-package fzf)
(setq fzf/args "--bind TAB:up,Shift-TAB:down -x --color dark --print-query --margin=1,0 --no-hscroll"
      fzf/position-bottom t
      fzf/window-height 12)

(global-set-key (kbd "M-f") 'fzf)

(provide 'init-fzf)
