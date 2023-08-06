local M = {}

M.treesitter = {
    ensure_installed = {
      "bash",
      "c",
      "c_sharp",
      "clojure",
      "cmake",
      "cpp",
      "css",
      "cue",
      "dockerfile",
      "elixir",
      "erlang",
      "fsh",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "go",
      "gomod",
      "gosum",
      "gowork",
      "haskell",
      "html",
      "ini",
      "java",
      "javascript",
      "json",
      "julia",
      "kotlin",
      "latex",
      "lua",
      "make",
      "markdown",
      "ninja",
      "proto",
      "python",
      "r",
      "ruby",
      "rust",
      "scala",
      "scss",
      "sql",
      "toml",
      "typescript",
      "v",
      "yaml",
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
