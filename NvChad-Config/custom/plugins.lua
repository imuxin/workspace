local plugins = {
  { "preservim/tagbar", lazy = false },

  {
    "neovim/nvim-lspconfig",
     config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
     end,
  },
}

return plugins
