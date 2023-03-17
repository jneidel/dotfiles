local hasmodule, autopairs = pcall( require, "nvim-autopairs" )

if hasmodule then
  autopairs.setup {
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
end

-- map <CR> to work with nvim-cmp
--[[ require('nvim-autopairs.completion.cmp').setup { -- deprecated
  map_cr = true,
  map_complete = true,
  auto_select = true,
  insert = true
} ]]
