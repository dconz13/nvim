-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

local is_mac = vim.fn.has("macunix") == 1
if not is_mac then
	vim.g.clipboard = "wl-copy"
end

vim.opt.rtp:prepend(lazypath)
-- Set line numbers
vim.opt.number = true
-- highlight syntax
vim.opt.syntax = "enable"
-- Tab 4 spaces
vim.opt.tabstop = 4
-- Tab new lines within functions correctly
vim.opt.shiftwidth = 4
-- Put my horizontal splits to the right instead of the left
vim.opt.splitright = true
-- Put my vertical splits under me instead of above me
vim.opt.splitbelow = true
-- Enable mouse in editor
vim.opt.mouse = 'a'
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  rocks = { enabled = false }
})

-- Telescope 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- nvim-lspconfig
vim.keymap.set('n', '<leader>ee', vim.diagnostic.open_float)

-- nvim-tree
vim.keymap.set('n', '<leader>fe', ":NvimTreeToggle<CR>", { desc = 'NvimTreeToggle' })
