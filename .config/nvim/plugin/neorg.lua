local hasmodule, neorg = pcall( require, "neorg" )

if hasmodule then
  vim.opt.foldlevelstart = 3

  neorg.setup {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.norg.concealer"] = {
        config = {
          icon_preset = "diamond",
          icons = {
            todo = {
              uncertain = {
                icon = "?"
              },
              on_hold = {
                icon = "="
              },
            }
  --      markup_preset = "dimmed",
  --      dim_code_blocks = {
  --        enabled = false,
  --      },
          }
        }
      }, -- Adds pretty icons to your documents
      ["core.norg.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            org = "~/org",
          },
          default_workspace = "org",
--          autodetect = true,
--          autochdir = true,
        },
      },
      ["core.keybinds"] = {
        config = {
          hook = function(keybinds)
            local leader = keybinds.leader
            -- ^<space> to cycle task between the states done, undone, pending
            -- gt<id> with id as the first letter of done, undone, pending, important, hold, canceled

            -- keybinds.remap_key("norg", "n", leader .. "tv", "<leader>ov")
            -- keybinds.remap_event("norg", "n", "<leader>oc", "core.gtd.base.capture")
            -- keybinds.remap_event("norg", "n", "]]", "core.integrations.treesitter.next.heading")
            -- keybinds.remap_event("norg", "n", "[[", "core.integrations.treesitter.previous.heading")

            -- manoeuvre
            -- keybinds.remap_key("norg", "n", "<M-k>", "<C-M-k>")
            -- keybinds.remap_key("norg", "n", "<M-j>", "<C-M-j>")

            -- new note
            -- keybinds.remap_key("norg", "n", leader .. "nn", "NN")
          end,
        }
      },
      ["core.norg.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
--       ["core.norg.qol.toc"] = {},
      -- ["core.export"] = {},
  --       ["core.export.markdown"] = {
  --           config = {
  --               extensions = "all",
  --           },
  --       },
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
  --       ["core.norg.esupports.metagen"] = {
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
