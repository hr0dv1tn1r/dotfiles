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


-- Atalhos de teclado para o Copilot Chat
vim.keymap.set('n', "<leader>cc", "<cmd>CopilotChat<CR>", { desc = "Abrir Chat do Copilot" })
vim.keymap.set('n', "<leader>ce", function()
    require("CopilotChat").ask_followup("Explique o código selecionado", { selection = require("CopilotChat.select").get_selection() })
end, { desc = "Copilot: Explicar código selecionado"})

-- Atalhos para dividir a tela (split) no estilo do Tmux
vim.keymap.set("n", "<leader>\"", "<cmd>split<CR>", { desc = "Split Horizontal (Tmux style)" })
vim.keymap.set("n", "<C-w>\"", "<cmd>split<CR>", { desc = "Split Horizontal (C-w)" })
vim.keymap.set("n", "<leader>%", "<cmd>vsplit<CR>", { desc = "Split Vertical (Tmux style)" })
vim.keymap.set("n", "<C-w>%", "<cmd>vsplit<CR>", { desc = "Split Vertical (C-w)" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--map("n", ";", ":", { desc = "CMD enter command mode" })
--map("i", "jk", "<ESC>")
