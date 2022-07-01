-- lua lsp
-- installation: see: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

-- local root_dir = vim.loop.cwd
-- local custom_on_attach = require('utils').custom_on_attach
-- local sumneko_root_path = vim.fn.stdpath('data') .. '/lua-language-server'
-- local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

-- require('lspconfig').sumneko_lua.setup {
--   cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
--   filetypes = { 'lua' },
--   settings = {
--     Lua = {
--       runtime = { version = 'LuaJIT' },
--       diagnostics = { globals = { 'vim' } },
--       workspace = {
--         library = vim.api.nvim_get_runtime_file('', true),
--         maxPreload = 100000,
--         preloadFileSize = 10000,
--       },
--       telemetry = { enable = false },
--     },
--   },
--   root_dir = root_dir,
--   on_attach = custom_on_attach,
-- }

-- vim.api.nvim_cmd({ cmd = 'LspStart' }, {})
