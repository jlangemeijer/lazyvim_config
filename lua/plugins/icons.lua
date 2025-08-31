-- lua/plugins.lua

-- LazyVim plugin spec
return {
  -- Nerd Font icons support
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup {
        -- enable default icons for all files
        default = true,
      }
    end,
  },
}
