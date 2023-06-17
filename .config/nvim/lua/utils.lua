-- utils

local M = {}

-- expand or minimize current buffer in a more natural direction
-- first parameter: true/false for vertical split
-- second parameter: expand/minimize factor e.g. 3 or -3
-- taken from: https://github.com/ibhagwan/nvim-lua/blob/main/lua/utils.lua
M.resize = function(vertical, margin)
  local cur_win = vim.api.nvim_get_current_win()
  vim.api.nvim_command(string.format('wincmd %s', vertical and 'l' or 'j'))
  local new_win = vim.api.nvim_get_current_win()
  local not_last = not (cur_win == new_win)
  local sign = margin > 0

  if (not_last == true) then
    vim.api.nvim_command('wincmd p')
  else
    sign = not sign
  end

  sign = sign and '+' or '-'
  local dir = vertical and 'vertical ' or ''
  local cmd = dir .. 'resize ' .. sign .. math.abs(margin) .. '<CR>'
  vim.api.nvim_command(cmd)
end

-- on lsp attach: mappings, document highlight
M.custom_on_attach = function(client)
  local map = vim.api.nvim_set_keymap
  local options = { noremap = true, silent = true }
  local define_augroup = M.define_augroup

  map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', options)
  map('n', 'gb', ':lua vim.lsp.buf.type_definition()<CR>', options)
  map('n', 'gy', ':lua vim.lsp.buf.implementation()<CR>', options)
  map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', options)
  map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', options)
  map('n', '<C-w>', ':lua vim.lsp.buf.signature_help()<CR>', options)
  map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', options)
  map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', options)
  map('n', '<C-n>', ':lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, focusable = false } })<CR>', options)
  map('n', '<C-p>', ':lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, focusable = false } })<CR>', options)
  map('n', '<leader>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>', options)
  map('n', '<leader>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>', options)
  map('n', '<leader>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', options)
  map('n', '<leader>wi', ':LspInfo<CR>', options)

  if (client.server_capabilities.document_highlight) then
    define_augroup({
      lsp = {
        { 'CursorHold,CursorHoldI', '<buffer>', ':lua vim.lsp.buf.document_highlight()' },
        { 'CursorMoved', '<buffer>', ':lua vim.lsp.buf.clear_references()' },
      }
    })
  end
end

M.lsp_setup = function()
  local custom_attach = function()
    local map = M.map

    map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
    map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
    map('n', 'gy', ':lua vim.lsp.buf.implementation()<CR>')
    map('n', 'gb', ':lua vim.lsp.buf.type_definition()<CR>')
    map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
    map('n', '<C-w>', ':lua vim.lsp.buf.signature_help()<CR>')
    map('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>')
    map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>')
    map('n', '<C-n>', ':lua vim.diagnostic.goto_next()<CR>')
    map('n', '<C-p>', ':lua vim.diagnostic.goto_prev()<CR>')
    map('n', '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<CR>')
    map('n', '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<CR>')
    map('n', '<space>wl', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
    map('n', '<leader>li', ':LspInfo<CR>')
    map('n', '<leader>ls', ':LspStop<CR>')

    vim.api.nvim_command('autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
    vim.api.nvim_command('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
  end
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local root_dir = vim.loop.cwd

  return custom_attach, capabilities, root_dir
end

local function merge( a, b ) -- Object.assign in js
  -- Source: https://stackoverflow.com/a/1283399
  if (b == nil) then
    return a
  end

  for k,v in pairs(b) do
    a[k] = v
  end

  return a
end

local function map( mode, binding, functionality, passed_options )
  local default_options = { noremap = true, silent = true }
  local options
  if (passed_options == nil) then
    options = default_options
  else
    options = merge(default_options, passed_options)
  end

  if (type(functionality) == "string") then
    return vim.api.nvim_set_keymap( mode, binding, functionality, options )
  else
    return vim.keymap.set( mode, binding, functionality, options )
  end
end
M.map = map

local function bufmap( mode, binding, functionality, passed_options )
  local default_options = { noremap = true, silent = true }
  local options
  if (passed_options == nil) then
    options = default_options
  else
    options = merge(default_options, passed_options)
  end

  return vim.api.nvim_buf_set_keymap( 0, mode, binding, functionality, options )
end
M.bufmap = bufmap

M.nmap = function( binding, functionality, opts )
  local defaults = { noremap = false, silent = true }
  local options = merge( defaults, opts )
  return map( "n", binding, functionality, options )
end
M.nnoremap = function( binding, functionality, opts )
  local defaults = { noremap = true, silent = true }
  local options = merge( defaults, opts )
  return map( "n", binding, functionality, options )
end

M.bufnmap = function( binding, functionality, opts )
  local defaults = { noremap = false, silent = true }
  local options = merge( defaults, opts )
  return bufmap( "n", binding, functionality, options )
end

return M
