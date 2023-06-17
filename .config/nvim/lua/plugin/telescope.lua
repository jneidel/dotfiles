return {
  keys = {
    { "<A-f>", mode = "n" },
    { "<A-F>", mode = "n" },
    { "<A-R>", mode = "n" },
    { "<A-r>", mode = "n" },
    { "<A-B>", mode = "n" },
    { "<A-s>", mode = "n" },
    { "<A-v>", mode = "n" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')

    if vim.fn.has( "macunix" ) then
      vim.cmd( "set rtp+=/usr/local/opt/fzf" )
      vim.cmd( "set rtp+=/usr/local/opt/rg" )
    end

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,

            -- open differently
            ["<c-s>"] = actions.select_horizontal,
            ["<c-v>"] = actions.select_vertical,
            ["<c-t>"] = actions.select_tab,

            -- move through list
            ["<Tab>"] = actions.move_selection_worse,
            ["<S-Tab>"] = actions.move_selection_better,

            -- scroll preview
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<a-d>"] = actions.delete_buffer + actions.move_to_top,
          },
        },
        file_ignore_patterns = {
          "node_modules/", "vendor/", ".git/", ".mp3", ".pdf", ".png", ".jpg", ".jpeg",
          ".mkv", ".mp4", ".zip", ".ods", ".m3u", "git/", ".cache", 'teams-for-linux/',
          '.local/lib', '.local/share/*/', 'BraveSoftware/', 'chromium', 'chrome/', 'firefox/',
          '.vim/sessions', '.vim/tmp', '.vim/backup', 'Signal', 'tmp/', 'ct/manga', 'ct/comics',
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        }
      },
    }
    telescope.load_extension('fzf')

    -- general file finder
    if vim.fn.getcwd() == os.getenv("HOME") then
      -- fzf as alternative for the home directoy, as telescope is very slow there
      vim.cmd( "let $FZF_DEFAULT_COMMAND = \"rg --ignore --hidden --files --type-add='exclude:*.{mp4,png,jpg,jpeg,pdf,mkv,mp4,zip,ods,m3u}' --type-not=exclude --glob='!.git/' --glob '!git/' --glob '!node_modules/' --glob '!.cache' --glob '!vendor/' --glob '!teams-for-linux/' --glob '!.local/lib' --glob '!.local/share/*/' --glob '!BraveSoftware/' --glob '!chromium' --glob '!chrome/' --glob '!firefox/' --glob '!.vim/sessions' --glob '!.vim/tmp' --glob '!.vim/backup' --glob '!Signal' --glob '!.ib-tws/' --glob '!.java/' --glob '!.hwid' --glob '!.zcompcache' --glob '!.pki/' --glob '!tmp/' --glob='!ct/manga' --glob='!ct/comics' --glob='!dotfiles/'\"" )
      vim.cmd( "command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, {'options': []}, <bang>0)" )

      vim.keymap.set("n", "<A-f>", ":Files<CR>", {});
      vim.keymap.set("n", "<A-s>", ":sp<CR> :Files<CR>", {});
      vim.keymap.set("n", "<A-v>", ":vsp<CR> :Files<CR>", {});
    else
      local function custom_find_files()
        vim.fn.system('git rev-parse --is-inside-work-tree')
        if vim.v.shell_error == 0 then
          builtin.git_files()
        else
          builtin.find_files({
            find_command = { "rg", "--files", "--hidden", "--ignore" },
          })
        end
      end

      vim.keymap.set("n", "<A-f>", custom_find_files, {});
    end
    vim.keymap.set("n", "<A-F>", builtin.buffers, {});

    vim.keymap.set("n", "<A-R>", builtin.current_buffer_fuzzy_find, {}); -- content current file
    vim.keymap.set("n", "<A-r>", builtin.live_grep, {}); -- content all files

    vim.keymap.set("n", "<A-B>", builtin.git_branches, {}); -- switch branch

    -- vim.keymap.set("n", "<A-g>", builtin.lsp_definitions, {}); -- go to defintion/coc alternative
    -- vim.keymap.set("n", "<A-g>", builtin.lsp_implementations, {}); -- go to defintion/coc alternative
    -- vim.keymap.set("n", "<A-g>", builtin.diagnostics, {});
  end,
}
