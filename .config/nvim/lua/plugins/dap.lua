return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      "mfussenegger/nvim-dap-python",
    },
    opts = function(_, opts)
      local dap = require("dap")

      -- Python
      require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

      -- Godot configuration
      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = 6006,
      }

      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
          launch_scene = true,
        },
      }

      -- Load launch.json configurations
      require("dap.ext.vscode").load_launchjs()

      return opts
    end,
  },
}
