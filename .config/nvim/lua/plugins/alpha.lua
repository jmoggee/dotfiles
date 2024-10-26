return {
  "goolord/alpha-nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", "󰱼  Find file", ":Telescope find_files<CR>"),
      dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("s", "  Settings", ":e $HOME/.config/nvim/init.lua | :cd %:p:h | split . | wincmd k | pwd<CR>"),
      dashboard.button("q", "󰈆  Quit NVIM", ":qa<CR>"),
    }

    local handle = io.popen("fortune")
    local fortune = handle:read("*a")
    handle:close()
    dashboard.section.footer.val = fortune

    alpha.setup(dashboard.opts)
  end,
}
