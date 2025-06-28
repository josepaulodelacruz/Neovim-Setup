return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    'Nvchad/nvim-colorizer.lua',
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
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
        "html",
        "css",
        "typescript",
        "javascript",
        "tsx",
        "php",
        "blade",
        "yaml"
      },

      highlight = {
        enable = true,
        use_languagetree = true,
      },

      indent = { enable = true },
    },

    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        {
          "L3MON4D3/LuaSnip",
          dependencies = "rafamadriz/friendly-snippets",
          opts = { history = true, updateevents = "TextChanged,TextChangedI" },
          config = function(_, opts)
            require("luasnip").config.set_config(opts)
            require "nvchad.configs.luasnip"
          end,
        },
        {
          "windwp/nvim-autopairs",
          opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
          },
          config = function(_, opts)
            require("nvim-autopairs").setup(opts)
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
          end,
        },
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
      opts = function()
        return require "nvchad.configs.cmp"
      end,
    },
  },


  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end

  }
}
