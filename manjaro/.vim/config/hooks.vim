" Run hooks for specific files

" Run markdown-toc on save
autocmd BufWritePost ~/code/dotfiles/videos.md !markdown-toc -i ~/code/dotfiles/videos.md
autocmd BufWritePost ~/code/dotfiles/readme.md !markdown-toc -i ~/code/dotfiles/readme.md
autocmd BufWritePost ~/code/dotfiles/manjaro/music.md !markdown-toc -i ~/code/dotfiles/readme.md

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost ~/.Xresources,~/.Xdefaults !xrdb %

