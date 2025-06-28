require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "eslint", "tailwindcss", "ts_ls" }
vim.lsp.enable(servers)

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
  settings = {
    intelephense = {
      stubs = {
        "bcmath",
        "bz2",
        "calendar",
        "Core",
        "curl",
        "zip",
        "zlib",
        "wordpress",
        "woocommerce",
        "acf-pro",
        "wordpress-globals",
        "wp-cli",
        "genesis",
        "polylang"
      },
      environment = {
        includePaths = {}
      },
      files = {
        maxSize = 5000000,
        associations = {"*.php", "*.phtml"},
        exclude = {
          "**/.git/**",
          "**/.svn/**",
          "**/.hg/**",
          "**/CVS/**",
          "**/.DS_Store/**",
          "**/node_modules/**",
          "**/bower_components/**",
          "**/vendor/**/{Tests,tests}/**",
          "**/.history/**",
          "**/vendor/**/vendor/**"
        }
      },
      format = {
        enable = true
      }
    }
  }
}


-- read :h vim.lsp.config for changing options of lsp servers 
