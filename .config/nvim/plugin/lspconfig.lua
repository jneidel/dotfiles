-- lsp

local fn, lsp = vim.fn, vim.lsp
local diagnostics_options = { signs = true, underline = true, virtual_text = { prefix = '●', spacing = 2, }, update_in_insert = true, severity_sort = true, }
local popup_options = { border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }, focusable = false }

-- diagnostics symbols
fn.sign_define('LspDiagnosticsSignError', { text = '', numhl = 'LspDiagnosticsDefaultError' })
fn.sign_define('LspDiagnosticsSignWarning', { text = '', numhl = 'LspDiagnosticsDefaultWarning' })
fn.sign_define('LspDiagnosticsSignInformation', { text = '', numhl = 'LspDiagnosticsDefaultInformation' })
fn.sign_define('LspDiagnosticsSignHint', { text = '', numhl = 'LspDiagnosticsDefaultHint' })

-- handlers
lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostics_options )
lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, popup_options)
lsp.handlers['textDocument/signatureHelp'] = lsp.with(lsp.handlers.signature_help, popup_options)

-- completion symbols
lsp.protocol.CompletionItemKind = {
  Class = ' ',
  Color = ' ',
  Constant = ' ',
  Constructor = ' ',
  Enum = '練',
  EnumMember = ' ',
  Event = ' ',
  Field = ' ',
  File = ' ',
  Folder = ' ',
  Function = ' ',
  Interface = 'ﰮ ',
  Keyword = ' ',
  Method = ' ',
  Module = ' ',
  Operator = ' ',
  Property = ' ',
  Reference = ' ',
  Snippet = '﬌ ',
  Struct = ' ',
  Text = ' ',
  TypeParameter = ' ',
  Unit = ' ',
  Value = ' ',
  Variable = ' ',
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
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
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
