return {
  config = function()
    -- nmap <Leader>p <Plug>(Prettier)

    -- Max line length that prettier will wrap on
    vim.g["prettier#config#print_width"] = 80

    -- Number of spaces per indentation level
    vim.g["prettier#config#tab_width"] = 2

    -- Use tabs over spaces
    vim.g["prettier#config#use_tabs"] = false

    -- Print semicolons
    vim.g["prettier#config#semi"] = true

    -- Single quotes over double quotes
    vim.g["prettier#config#single_quote"] = false

    -- Print spaces between brackets
    vim.g["prettier#config#bracket_spacing"] = true

    -- Put > on the last line instead of new line
    vim.g["prettier#config#jsx_bracket_same_line"] = false

    -- Include parentheses around a sole arrow function parameter (avoid|always)
    vim.g["prettier#config#arrow_parens"] = "avoid"

    -- Print trailing commas wherever possible when multi-line (none|es5|all)
    vim.g["prettier#config#trailing_comma"] = "all"

    -- Specify which parser to use (flow|babylon|typescript)
    vim.g["prettier#config#parser"] = "babylon"

    -- Wrap prose if it exceeds the print width (always|never|preserve)
    vim.g["prettier#config#prose_wrap"] = "always"

    -- Specify the global whitespace sensitivity for HTML files (css|strict|ignore)
    vim.g["prettier#config#html_whitespace_sensitivity"] = "css"

    -- How config file should be evaluated in combination with CLI options (cli-override|file-override|prefer-file)
    vim.g["prettier#config#config_precedence"] = "cli-override"
  end
}
