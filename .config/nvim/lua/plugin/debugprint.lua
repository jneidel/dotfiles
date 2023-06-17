local nmap = require("utils").nmap

return {
  keys = {
    { "gl", mode = "n" },
    { "gL", mode = "n" },
  },

  config = function()
    local debugprint = require("debugprint")
    debugprint.setup({ create_keymaps = false })

    nmap( "gl", function()
      return debugprint.debugprint({ variable = true })
    end, { expr = true } )
    nmap( "gL", function()
      return debugprint.debugprint()
    end, { expr = true } )
  end
}
