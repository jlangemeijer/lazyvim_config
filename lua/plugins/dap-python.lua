return {
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    keys = {
      { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug Method" },
      { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug Class" },
    },
    config = function()
      local python_path = vim.fn.exepath("python") -- uses Pixi’s python from PATH
      require("dap-python").setup(python_path)
    end,
  },
}
