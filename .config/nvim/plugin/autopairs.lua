local hasmodule, autopairs = pcall( require, "nvim-autopairs" )

if hasmodule then
  autopairs.setup {
    check_ts = true, -- treesitter
  }
  autopairs.remove_rule('"')
  autopairs.remove_rule("'")
end
