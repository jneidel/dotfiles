-- local hascmp, cmp = pcall( require, "cmp" )
local hascmp_lsp, cmp_lsp = pcall( require, "cmp_nvim_lsp" )
local haslspconfig, lspconfig = pcall( require, "lspconfig" )

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
if hascmp_lsp then
  capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
if haslspconfig then
  local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      -- on_attach = my_custom_on_attach,
      capabilities = capabilities,
    }
  end
end

-- luasnip setup
-- local luasnip = require('luasnip')
