return {
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup {
      check_ts = true, -- treesitter
    }
    autopairs.remove_rule('"')
    autopairs.remove_rule("'")
  end
}
