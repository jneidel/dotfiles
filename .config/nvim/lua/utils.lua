-- utils

local M = {}

-- autocommands
M.define_augroup = function(definitions)
  local cmd = vim.api.nvim_command

  for group_name, definition in pairs(definitions) do
    cmd('augroup ' .. group_name)
    cmd('autocmd!')

    for _, def in pairs(definition) do
      cmd(table.concat(vim.tbl_flatten({ 'autocmd', def }), ' '))
    end

    cmd('augroup END')
  end
end

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

  if (client.resolved_capabilities.document_highlight) then
    define_augroup({
      lsp = {
        { 'CursorHold,CursorHoldI', '<buffer>', ':lua vim.lsp.buf.document_highlight()' },
        { 'CursorMoved', '<buffer>', ':lua vim.lsp.buf.clear_references()' },
      }
    })
  end
end

return M