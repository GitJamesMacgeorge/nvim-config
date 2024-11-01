vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Add all other configurations
require("settings")
require("keymaps")
require("plugins")
require("colours")
require("lsp.init")
require("after.treesitter")
require("after.autopairs")
require("after.telescope")
