-- docs: https://github.com/plasticboy/vim-markdown#options

vim.g.vim_markdown_follow_anchor = 1 -- ge to follow: [local](file.md#myheader)
vim.g.vim_markdown_no_extensions_in_markdown = 1
vim.g.vim_markdown_autowrite = 1
vim.g.vim_markdown_edit_url_in = 'current' -- current, vsplit, hsplit
vim.g.vim_markdown_folding_style_pythonic = 1 -- fold on headlines
vim.g.vim_markdown_folding_level = 2 -- ## is unfolded at open
vim.g.vim_markdown_new_list_item_indent = 0

-- concealing: https://github.com/plasticboy/vim-markdown#syntax-concealing
vim.opt.conceallevel = 2
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 0
vim.g.vim_markdown_strikethrough = 1

