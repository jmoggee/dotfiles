return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
    "nanozuki/tabby.nvim",
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    -- Store previous tab/window
    local previous_tab = nil
    local previous_win = nil
    local debug_tab = nil
    local is_debug_open = false

    local function _store_current_position()
      previous_tab = vim.api.nvim_get_current_tabpage()
      previous_win = vim.api.nvim_get_current_win()
    end

    local function _create_debug_tab()
      vim.cmd('tabnew %')
      debug_tab = vim.api.nvim_get_current_tabpage()
      vim.cmd("TabRename DEBUG")
    end

    local function _restore_previous_position()
      if previous_tab and vim.api.nvim_tabpage_is_valid(previous_tab) then
        vim.api.nvim_set_current_tabpage(previous_tab)
        if previous_win and vim.api.nvim_win_is_valid(previous_win) then
          vim.api.nvim_set_current_win(previous_win)
        end
      end
    end

    local function _close_debug_tab()
      if debug_tab and vim.api.nvim_tabpage_is_valid(debug_tab) then
        vim.cmd('silent! ' .. vim.api.nvim_tabpage_get_number(debug_tab) .. 'tabclose')
      end
    end

    local function _reset_state()
      debug_tab = nil
      previous_tab = nil
      previous_win = nil
      is_debug_open = false
    end

    -- Public functions
    local function open_dap_in_tab()
      if is_debug_open then
        return
      end

      _store_current_position()
      _create_debug_tab()
      dapui.open()
      is_debug_open = true
    end

    local function cleanup_dap_tab()
      if not is_debug_open then
        return
      end

      dapui.close()
      _restore_previous_position()
      _close_debug_tab()
      _reset_state()
    end

    dapui.setup({})

    require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

    dap.listeners.before.attach.dapui_config = function()
      open_dap_in_tab()
    end
    dap.listeners.before.launch.dapui_config = function()
      open_dap_in_tab()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      cleanup_dap_tab()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      cleanup_dap_tab()
    end
    dap.listeners.before.disconnect.dapui_config = function()
      cleanup_dap_tab()
    end

    require("dap.ext.vscode").load_launchjs()

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end,
}
