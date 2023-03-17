local hasmodule, cmp = pcall( require, "cmp" )

if hasmodule then
  local luasnip = require("luasnip")

  local function check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
  end

  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    -- window.documentation = cmp.config.window.bordered()
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
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      -- ['<Tab>'] = function(fallback)
      --   if (vim.fn.pumvisible() == 1) then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      --   elseif (check_back_space()) then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
      --   elseif (require('luasnip').expand_or_jumpable()) then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      --   else
      --     fallback()
      --   end
      -- end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      -- ['<S-Tab>'] = function(fallback)
      --   if (vim.fn.pumvisible() == 1) then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      --   elseif (require('luasnip').jumpable(-1)) then
      --     vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      --   else
      --     fallback()
      --   end
      -- end,
      -- ['<CR>'] = cmp.mapping.confirm(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    },
    sources = {
      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'spell' },
      { name = 'luasnip' },
    },
  }
end
