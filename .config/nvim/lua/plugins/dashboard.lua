return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local logo = {
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

    opts.config.header = logo

    -- Get fortune
    local fortune = ""
    local handle = io.popen("fortune")
    if handle then
      fortune = handle:read("*a")
      handle:close()
    end

    local original_footer = opts.config.footer

    opts.config.footer = function()
      local default_footer = original_footer and original_footer() or {}
      local fortune_lines = vim.split(fortune, "\n", { trimempty = true })

      table.insert(fortune_lines, 1, "")
      table.insert(fortune_lines, 1, "─────────────────────")
      table.insert(fortune_lines, 1, "")

      if type(default_footer) == "table" then
        for _, line in ipairs(fortune_lines) do
          table.insert(default_footer, line)
        end

        return default_footer
      else
        return fortune_lines
      end
    end

    return opts
  end,
}
