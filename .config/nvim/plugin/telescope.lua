local hasmodule, telescope = pcall( require, "telescope" )
-- :Telescope find_files
-- :Telescope git_files
-- :Telescope buffers

if hasmodule then
  telescope.setup {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      }
    }
  }
  telescope.load_extension('fzf')

  local builtin = require('telescope.builtin');
  vim.keymap.set("n", "<A-f>", builtin.buffers, {});
  vim.keymap.set("n", "<A-g>", builtin.git_files, {});
  vim.keymap.set("n", "<A-F>", builtin.find_files, {});
  -- vim.api.nvim_set_keymap("n", "<A-f>", ":Telescope buffers<cr>", {});
end
