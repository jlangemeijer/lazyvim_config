return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,  -- load immediately
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = { "mfussenegger/nvim-dap" },
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = false,
    dependencies = { "mfussenegger/nvim-dap", "nvim-lua/plenary.nvim" },
  },
}

