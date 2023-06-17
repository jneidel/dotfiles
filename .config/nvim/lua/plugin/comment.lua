return {
  config = function()
    local comment = require("Comment")
    comment.setup()

    local ft = require("Comment.ft")
    ft.set("pug", { "// %s", "// %s" })
  end,

  keys = {
    { "gcc", mode = "n" },
    { "gc", mode = "v" },
  },
}
