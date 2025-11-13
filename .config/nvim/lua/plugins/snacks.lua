return {
  "folke/snacks.nvim",

  opts = {
    picker = {
      -- focus = "list",
      matches = {
        frecency = true,
      },
      sources = {
        lsp_definitions = { auto_confirm = false },
        lsp_implementations = { auto_confirm = false },
        lsp_references = { auto_confirm = false },
        lsp_declarations = { auto_confirm = false },
      },
    },
  },

  keys = {
    -- FILE PICKERS
    {
      "<leader>ff",
      mode = { "n" },
      function()
        Snacks.picker.smart({ layout = "ivy" })
      end,
      desc = "File Picker",
    },
    {
      "<leader>/",
      mode = { "n" },
      function()
        Snacks.picker.grep({ layout = "ivy" })
      end,
      desc = "File Grep Picker",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>fe",
      mode = { "n" },
      function()
        Snacks.picker.explorer()
      end,
      desc = "File Explorer",
    },

    -- BUFFER PICKERS
    {
      "<leader>bb",
      mode = { "n" },
      function()
        Snacks.picker.buffers({ layout = "ivy" })
      end,
      desc = "Buffer Picker",
    },
    {
      "<leader>bg",
      mode = { "n" },
      function()
        Snacks.picker.grep_buffers({ layout = "ivy" })
      end,
      desc = "Buffer Grep Picker",
    },

    -- GIT PICKERS
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
    {
      "<leader>gi",
      function()
        Snacks.picker.gh_issue()
      end,
      desc = "Github Issues (open)",
    },
    {
      "<leader>gI",
      function()
        Snacks.picker.gh_issue({ state = "all" })
      end,
      desc = "Github Issues (open)",
    },
    {
      "<leader>gp",
      function()
        Snacks.picker.gh_pr()
      end,
      desc = "Github Pull Requests (open)",
    },
    {
      "<leader>gP",
      function()
        Snacks.picker.gh_pr({ state = "all" })
      end,
      desc = "Github Pull Requests (all)",
    },

    -- LSP PICKERS
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "gai",
      function()
        Snacks.picker.lsp_incoming_calls()
      end,
      desc = "C[a]lls Incoming",
    },
    {
      "gao",
      function()
        Snacks.picker.lsp_outgoing_calls()
      end,
      desc = "C[a]lls Outgoing",
    },
    {
      "gls",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "gws",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },

    -- HELP PICKERS
    {
      "<leader>hh",
      mode = { "n" },
      function()
        Snacks.picker.help({ layout = "ivy" })
      end,
      desc = "Help Picker",
    },
    {
      "<leader>hi",
      mode = { "n" },
      function()
        Snacks.picker.highlights({ layout = "ivy" })
      end,
      desc = "Help Picker",
    },

    -- SCRATCH
    {
      "<leader>fs",
      mode = { "n" },
      function()
        Snacks.scratch()
      end,
      desc = "Scratch Buffer",
    },
    {
      "<leader>fS",
      mode = { "n" },
      function()
        Snacks.scratch.select()()
      end,
      desc = "Select Scratch Buffer",
    },
  },
}
