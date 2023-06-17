local nmap = require("utils").nmap

nmap( "<leader>k", ":w<CR> :!shellcheck -e SC2006,SC1090,SC1001,SC2086 %<CR>")
