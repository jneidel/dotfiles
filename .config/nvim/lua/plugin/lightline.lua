return {
  config = function()
    vim.opt.laststatus = 2 -- always display the status bar
    vim.opt.showmode = false -- hide "--INSERT--" in status bar

    vim.cmd( "source ~/.config/nvim/vimscript/lightline.vim" )
  end
}
