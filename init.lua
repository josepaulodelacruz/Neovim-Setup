-----------------------------------------------------------
-- ✨ Neovide Init.lua
-----------------------------------------------------------

-- Cache & leader
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "

-----------------------------------------------------------
-- Lazy.nvim bootstrap
-----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-----------------------------------------------------------
-- Disable line numbers for .txt
-----------------------------------------------------------
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.txt",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

-----------------------------------------------------------
-- Windows PowerShell
-----------------------------------------------------------
if vim.fn.has("win32") == 1 then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellxquote = ""
  vim.opt.shellquote = ""
  vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
  vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
end

-----------------------------------------------------------
-- 🌸 Neovide settings
-----------------------------------------------------------
if vim.g.neovide then
   -- Semi-transparent base so blur is visible
  vim.g.neovide_opacity = 0.5
  -- The background color must include alpha to blend
  -- format: #RRGGBBAA (AA = hex alpha). 80 ≈ 50% opacity.
  vim.g.neovide_background_color = "#1e1e2e80"

  -- Enable and control blur
  -- strength: 0 (none) → 1 (strong). Adjust to taste.
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_blur          = 0.7

  -- Optional: nice subtle shadow for floating windows
  vim.g.neovide_window_blurred = true

  -- Scale factor 
  vim.g.neovide_scale_factor = 0.8

  -- Font
  vim.opt.guifont = "ComicShannsMono Nerd Font Mono:h14"

  -- Cursor effects
  vim.g.neovide_cursor_vfx_mode = "wave"
  vim.g.neovide_cursor_vfx_opacity = 250
  vim.g.neovide_cursor_vfx_particle_density = 10.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 0.8
  vim.g.neovide_max_fps = 120

  -- Zoom keymaps
  local set = vim.keymap.set
  set({ "n", "v" }, "<C-+>", function() vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1) + 0.1 end)
  set({ "n", "v" }, "<C-->", function() vim.g.neovide_scale_factor = (vim.g.neovide_scale_factor or 1) - 0.1 end)
  set({ "n", "v" }, "<C-0>", function() vim.g.neovide_scale_factor = 1.0 end)

  -- Toggles
  set("n", "<F10>", function()
    vim.g.neovide_transparency = (vim.g.neovide_transparency == 1.0) and 0.9 or 1.0
  end, { silent = true })
  set("n", "<F11>", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
  end, { silent = true })
end

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
local lazy_config = require("configs.lazy")
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy   = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

-----------------------------------------------------------
-- NvChad core
-----------------------------------------------------------
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
require("options")
require("nvchad.autocmds")
vim.schedule(function() require("mappings") end)
