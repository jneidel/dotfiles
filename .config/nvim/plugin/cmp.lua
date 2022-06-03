-- cmp

local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

require('cmp').setup {
  snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
  -- documentation = { maxwidth = 60, maxheight = 40, border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = vim.lsp.protocol.CompletionItemKind[vim_item.kind] .. ' ' .. vim_item.kind
      vim_item.menu = ({
        buffer = '[BUF]',
        path = '[PTH]',
        spell = '[SPL]',
        nvim_lsp = '[LSP]',
        luasnip = '[SNP]',
      })[entry.source.name]

      return vim_item
    end,
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if (vim.fn.pumvisible() == 1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif (check_back_space()) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
      elseif (require('luasnip').expand_or_jumpable()) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if (vim.fn.pumvisible() == 1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif (require('luasnip').jumpable(-1)) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<CR>'] = require('cmp').mapping.confirm(),
  },
  sources = {
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'spell' },
  },
}
