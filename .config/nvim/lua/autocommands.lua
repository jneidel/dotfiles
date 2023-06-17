local au = vim.api.nvim_create_autocmd
local HOME = os.getenv( "HOME" )

-- ## fix missing filetypes
local function setFt( pattern, ft )
  au({"BufEnter"}, {
    pattern = pattern,
    command = "setlocal filetype=" .. ft,
  })
end

setFt({HOME .. "/todo"}, "markdown")
setFt({HOME .. "/.config/conky", "*conkyrc*"}, "conkyrc")
setFt({HOME .. "/.config/newsboat/urls-*" }, "conf")
setFt({"*.eslintrc*"}, "json" )
setFt({"*/pubs/notes/*.txt"}, "markdown" )
setFt({"*journal*" }, "markdown")

-- { 'FileType', 'help,lspinfo,qf', 'nnoremap <buffer> <silent> q :q<CR>' },

-- ## hooks
local function onWrite( pattern, command )
  au({"BufWritePost"}, {
    pattern = pattern,
    command = command,
  })
end

-- update TOC
onWrite({HOME .. "/code/dotfiles/README.md"}, "!markdown-toc -i ~/code/dotfiles/README.md")

-- restart application after writing config
onWrite({HOME .. "/.Xresources", HOME .. "/.Xdefaults" }, "!xrdb %")
onWrite({HOME .. "/.config/sxhkd/sxhkdrc"}, "!kill $(pidof sxhkd); sxhkd 2>/dev/null &")
onWrite({HOME .. "/.config/dunst/dunstrc"}, "!kill $(pidof dunst); dunst &")

-- format fcrontab buffer after writing
onWrite({"/tmp/fcr-*"}, "silent %!column -t")

-- regenerate SRCINFO on PKGBUILD write
onWrite({"PKGBUILD"}, "!makepkg --printsrcinfo >.SRCINFO")


-- onWrite({HOME .. "
