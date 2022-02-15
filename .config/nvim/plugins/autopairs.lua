-- autopairs
require('nvim-autopairs').setup {
  check_ts = true,
  map_bs = true,
  fast_wrap = {
    map = '<C-w>',
    chars = { '{', '[', '(', '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
    end_key = 'w',
    keys = 'qwertzuiopasdfghjklyxcvbnm',
    check_comma = true,
    hightlight = 'Search'
  },
}

-- map <CR> to work with nvim-cmp
require('nvim-autopairs.completion.cmp').setup {
  map_cr = true,
  map_complete = true,
  auto_select = true,
  insert = true
}
