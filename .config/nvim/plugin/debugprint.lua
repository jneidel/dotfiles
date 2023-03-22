local hasmodule, debugprint = pcall( require, "debugprint" )
local nmap = require( "utils" ).nmap

if hasmodule then
  nmap( "gl", function()
    return debugprint.debugprint({ variable = true })
  end, { expr = true } )
  nmap( "gL", function()
    return debugprint.debugprint()
  end, { expr = true } )
end
