local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    -- Mason Base Plugin
    "williamboman/mason.nvim",
  },
  {
    -- The Bridge to LSP Server (Mason - lspconfig)
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensured_installed = {
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettierd", --Prettier but in daemon, thats better performance
      }
    }
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "go",
        "rust",
        "python",
        "css",
        "html",
      }
      return opts
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  {
    "brenoprata10/nvim-highlight-colors",
    opts = {
      render = "background",  -- Or "foreground" for text color
      enable_named_colors = true,
      enable_tailwind = true,
    },
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { 
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {},
  },
}
return plugins
