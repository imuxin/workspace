local M = {}

M.treesitter = {
    ensure_installed = {
      "c",
      "lua",
      "go",
      "rust",
      "yaml",
      "json",
      "toml",
	  "zig",
    },
    indent = {
      enable = true,
      -- disable = {
      --   "python"
      -- },
    },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    -- "typescript-language-server",
    -- "deno",
    -- "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- go
    "gopls",

    -- rust
    "rust-analyzer",

    -- zig
    "zls",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
