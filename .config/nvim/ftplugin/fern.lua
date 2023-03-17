local bufnmap  = require('utils').bufnmap

-- open in current buffer or navigate
bufnmap( "<CR>", "<Plug>(fern-action-open-or-enter)" )
bufnmap( "l", "<Plug>(fern-action-open-or-expand)" )
bufnmap( "L", "<Plug>(fern-action-open) :Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>" )

-- navigate
bufnmap( "h", "<Plug>(fern-action-collapse)" )
bufnmap( "H", "<Plug>(fern-action-leave)" )
bufnmap( "K", "<Plug>(fern-action-leave)" )
bufnmap( "J", "<Plug>(fern-action-expand)" )
bufnmap( "<BS>", "<Plug>(fern-action-leave)" )

-- open in new split/tab
bufnmap( "v", "<Plug>(fern-action-open:side) :Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>" )
bufnmap( "s", "<Plug>(fern-action-open:below) :Fern %:p:h:h -reveal=%:p:h -drawer -toggle<CR>" )
bufnmap( "t", "<Plug>(fern-action-open:tabedit)" )

-- file management
bufnmap( "rm", "<Plug>(fern-action-remove)" )
bufnmap( "T", "<Plug>(fern-action-new-file)" )
bufnmap( "d", "<Plug>(fern-action-new-dir)" )

-- preview
bufnmap( "p", "<Plug>(fern-action-preview:toggle)" )
bufnmap( "<C-d>", "<Plug>(fern-action-preview:scroll:down:half)" )
bufnmap( "<C-u>", "<Plug>(fern-action-preview:scroll:up:half)" )

-- other
bufnmap( "u", "<Plug>(fern-action-hidden:toggle)" )
