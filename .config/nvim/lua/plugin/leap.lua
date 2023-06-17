return {
  keys = {
    { "s", mode = "n" },
    { "S", mode = "n" },
  },

  config = function()
    require("leap").add_default_mappings()
  end,
}
