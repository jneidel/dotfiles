return {
  keys = {
    "<C-h>",
    "<C-j>",
    "<C-k>",
    "<C-l>",
  },

  config = function()
    require( 'nvim-tmux-navigation' ).setup( {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
      }
    } )
  end
}
