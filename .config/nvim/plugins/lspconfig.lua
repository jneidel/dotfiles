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
