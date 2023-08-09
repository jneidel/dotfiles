return {
  config = function()
    local neorg = require("neorg")

    vim.opt.foldlevelstart = 3

    -- local localLeaderKey = "-"
    -- vim.api.nvim_set_keymap('', localLeaderKey, '<Nop>', { noremap = true, silent = true })
    -- vim.g.maplocalleader = localLeaderKey

    -- max concealing
    vim.opt.conceallevel = 3

    neorg.setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          -- https://github.com/nvim-neorg/neorg/wiki/Concealer
          config = {
            icon_preset = "diamond",
            folds = true,
            icons = {
              todo = {
                done = {
                  icon = ""
                },
                pending = {
                  icon = "" -- ""
                },
                uncertain = { -- task_ambiguous
                  icon = ""
                },
                on_hold = {
                  icon = ""
                },
                cancelled = {
                  icon = ""
                },
                urgent = { -- task_important
                  icon = "!"
                },
              }
            }
          }
        }, -- Adds pretty icons to your documents
        ["core.qol.todo_items"] = {
          -- https://github.com/nvim-neorg/neorg/wiki/Todo-Items
          config = {
            order = {
              { "undone", " " },
              { "done", "x" },
            }
          }
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          -- https://github.com/nvim-neorg/neorg/wiki/Dirman
          config = {
            workspaces = {
              org = "~/org",
            },
            default_workspace = "org",
            -- recommended to set Neovim autochdir
          },
        },
        ["core.keybinds"] = {
          config = {
            neorg_leader = '<localleader>',
            hook = function(keybinds)
              local leader = keybinds.leader

              -- https://github.com/nvim-neorg/neorg/wiki/Todo-Items
              keybinds.remap_event("norg", "n", "gtd", "core.qol.todo_items.todo.task_done") keybinds.remap_event("norg", "n", "gtu", "core.qol.todo_items.todo.task_undone")
              keybinds.remap_event("norg", "n", "gtp", "core.qol.todo_items.todo.task_pending")
              keybinds.remap_event("norg", "n", "gth", "core.qol.todo_items.todo.task_on_hold")
              keybinds.remap_event("norg", "n", "gtc", "core.qol.todo_items.todo.task_cancelled")
              keybinds.remap_event("norg", "n", "gtr", "core.qol.todo_items.todo.task_recurring")
              keybinds.remap_event("norg", "n", "gti", "core.qol.todo_items.todo.task_important")
              keybinds.remap_event("norg", "n", "gta", "core.qol.todo_items.todo.task_ambiguous")
              keybinds.remap_event("norg", "n", "<C-Space>", "core.qol.todo_items.todo.task_cycle")
              keybinds.remap_event("norg", "n", "<C-S-Space>", "core.qol.todo_items.todo.task_cycle_reverse")

              -- new neorg file
              keybinds.remap_event("norg", "n", "NN", "core.dirman.new.note")

              -- open toc
              keybinds.map("norg", "n", "TT", "<cmd>Neorg toc qflist<CR>")

              -- >>/<< to promote/demote heading/todos
              -- https://github.com/nvim-neorg/neorg/wiki/Promo

              -- keybinds.remap_key("norg", "n", leader .. "tv", "<leader>ov")
              -- keybinds.remap_event("norg", "n", "]]", "core.integrations.treesitter.next.heading")
              -- keybinds.remap_event("norg", "n", "[[", "core.integrations.treesitter.previous.heading")

              -- manoeuvre
              -- keybinds.remap_key("norg", "n", "<M-k>", "<C-M-k>")
              -- keybinds.remap_key("norg", "n", "<M-j>", "<C-M-j>")
            end,
          }
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.qol.toc"] = {
          config = {
            close_after_use = true
          }
        },
        ["core.esupports.metagen"] = {
          -- https://github.com/nvim-neorg/neorg/wiki/Metagen
          config = {
            type = "auto",
            template = {
              -- src: https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/esupports/metagen/module.lua
              { "title", function()
                local name = vim.fn.expand("%:p:t:r")
                if name == "index" then
                  return "<++>"
                else
                  return name
                end
              end },
              { "description", "<++>" },
              { "categories", "<++>"},
              { "authors", function() return require("neorg.core.utils").get_username() end },
              { "created", function() return os.date("%Y-%m-%d") end },
              { "updated", function() return os.date("%Y-%m-%d") end },
            }
          }
        },
        ["core.summary"] = {}, -- https://github.com/nvim-neorg/neorg/wiki/Summary
        ["core.ui.calendar"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {
          config = {
            extensions = "all",
          },
        },
      },
    }

    --       ["core.highlights"] = {
    --           config = {
    --               highlights = {
    --                   headings = {
    --                       ["1"] = {
    --                           title = "+TSTitle",
    --                           prefix = "+TSTitle",
    --                       },
    --                   },
    --                   quotes = {
    --                       ["1"] = {
    --                           prefix = "+Grey",
    --                           content = "+Grey",
    --                       },
    --                   },
    --               },
    --           },
    --       },
    --       ["core.esupports.metagen"] = {
    --           config = {
    --               type = "<leader>om",
    --           },
    --       },
    --       ["core.presenter"] = {
    --           config = {
    --               zen_mode = "zen-mode",
    --           }
    --       },
  end
}
