" Run hooks for specific files

" Run markdown-toc on save
au BufWritePost ~/code/dotfiles/videos.md !markdown-toc -i ~/code/dotfiles/videos.md
au BufWritePost ~/code/dotfiles/readme.md !markdown-toc -i ~/code/dotfiles/readme.md
au BufWritePost ~/code/dotfiles/manjaro/music.md !markdown-toc -i ~/code/dotfiles/readme.md

" Run xrdb whenever Xdefaults or Xresources are updated.
au BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

" Generate eslint configs on save and restart eslint daemon
au BufWritePost ~/.eslint/*.json !~/.eslint/generate-eslint-configs.js
au BufWritePost ~/.eslint/*.json !eslint_d restart

