-- Carrega todos os atalhos padrão do NvChad.
require "nvchad.mappings"

-- add yours here

-- Navegação entre janelas (splits)
vim.keymap.set("n", "<C-h>", "<cmd>VimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>VimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>VimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>VimTmuxNavigateRight<CR>", { silent = true })

-- Remover destaque da busca
vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>', { silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--map("n", ";", ":", { desc = "CMD enter command mode" })
--map("i", "jk", "<ESC>")
