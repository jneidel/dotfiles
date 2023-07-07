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

  defineFzfUserCommands = function()
    vim.api.nvim_create_user_command(
      'Files',
      "call fzf#vim#files(<q-args>, fzf#vim#files(<q-args>, {'options': []}, <bang>0), <bang>0)",
      { bang = true, nargs = '?' }
    )
  end,

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')
    local HOME = os.getenv("HOME")

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
          ".mkv", ".avi", ".flac", ".mp4", ".zip", ".ods", ".m3u", ".url", "git/", ".cache",
          '.local/lib', '.local/share/*/', 'BraveSoftware/', 'chromium', 'chrome/', 'firefox/',
          '.vim/sessions', '.vim/tmp', '.vim/backup', 'Signal', 'tmp/', 'ct/manga', 'ct/comics',
          ".cbr", "cbz", 'teams-for-linux/', ".aac", ".mpc", ".epub", ".sql", ".ydb", ".JPG", ".xlsx",
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

    local function register_fzf_find_files()
      telescope.load_extension('fzf')

      -- fzf as alternative for the home directoy, as telescope is very slow there
      vim.cmd( "let $FZF_DEFAULT_COMMAND = \"rg --ignore --hidden --files --type-add='exclude:*.{mp3,png,jpg,JPG,jpeg,pdf,mkv,mp4,avi,zip,ods,xlsx,m3u,url,aac,mpc,epub,sql,ydb}' --type-not=exclude --glob='!.git/' --glob '!git/' --glob '!node_modules/' --glob '!.cache' --glob '!vendor/' --glob '!teams-for-linux/' --glob '!.local/lib' --glob '!.local/share/*/' --glob '!BraveSoftware/' --glob '!chromium' --glob '!chrome/' --glob '!firefox/' --glob '!Signal' --glob '!.ib-tws/' --glob '!.java/' --glob '!.zcompcache' --glob '!tmp/' --glob='!ct/manga' --glob='!ct/comics' --glob='!dotfiles/' -g='!coverage' -g='!dist/' -g='!build/' -g='!.gradle/'\"" )
      vim.cmd( "let $FZF_DEFAULT_OPTS = \"--bind TAB:up,Shift-TAB:down\"" )

      vim.keymap.set("n", "<A-f>", ":Files<CR>", {});
      vim.keymap.set("n", "<A-s>", ":sp<CR> :Files<CR>", {});
      vim.keymap.set("n", "<A-v>", ":vsp<CR> :Files<CR>", {});
      vim.keymap.set("n", "<A-t>", ":tabe<CR> :Files<CR>", {});
    end

    local function use_git_find_files_if_git_repo()
      local function is_git_repo()
        vim.fn.system("git rev-parse --is-inside-work-tree")
        return vim.v.shell_error == 0
      end
      local function get_git_root()
        local dot_git_path = vim.fn.finddir(".git", ".;")
        return vim.fn.fnamemodify(dot_git_path, ":h")
      end

      local opts = {
        find_command = { "rg", "--files", "--hidden", "--ignore" },
        prompt_title = "Find in git",
      }
      -- if is_git_repo() then
      --   opts.cwd = get_git_root()
      -- end
      builtin.find_files( opts )

      -- vim.fn.system('git rev-parse --is-inside-work-tree')
      -- if vim.v.shell_error == 0 then
      --   builtin.git_files()
    end

    local function find_files_in_dir( dir, title )
      builtin.find_files({
        find_command = { "rg", "--files", "--hidden", "--ignore" },
        prompt_title = "Find in "..title,
        cwd = dir,
      })
    end
    local function find_in_org()
      find_files_in_dir( HOME.."/org", "org" )
    end

    -- general file finder
    if vim.fn.getcwd() == HOME then
      register_fzf_find_files()
    elseif string.find( vim.fn.getcwd(), HOME.."/org" ) then
      vim.keymap.set("n", "<A-f>", find_in_org, {});
    else
      vim.keymap.set("n", "<A-f>", use_git_find_files_if_git_repo, {});
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
