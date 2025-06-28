return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { import = "nvchad.blink.lazyspec" },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "lua-language-server",
        -- "stylua",
        -- "html-lsp",
        "css-lsp",
        "prettier",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "intelephense",

        -- Formatters
        "php-cs-fixer",
        "blade-formatter",

          -- Linters
        "phpstan",
        "eslint_d",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- "vim",
        -- "lua",
        -- "vimdoc",
        -- "html",
        "css",
        "typescript",
        "javascript",
        "tsx",
        "php",
        "blade",
        "yaml",
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
