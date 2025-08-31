return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio", -- needed by dap-ui
    },
    keys = {
      -- Basic keymaps
      { "<F5>", function() require("dap").continue() end, desc = "Start/Continue Debugging" },
      { "<F10>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Step Into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Set Conditional Breakpoint" },
      { "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last Debug Session" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      -- Auto-open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "Visual", numhl = "" })

    end,
  },

  -- Python debugging
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    config = function()
      local path
      -- use the same Python executable that runs Neovim (Pixi's env)
      local venv_python = vim.fn.exepath("python") -- resolves "python" in PATH
      require("dap-python").setup(venv_python)

    end,
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug Test Method" },
      { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug Test Class" },
    },
  },
}
