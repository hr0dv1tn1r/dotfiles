
-- Navegação entre janelas (splits)
vim.keymap.set("n", "<C-h>", "<cmd>VimTmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>VimTmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>VimTmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>VimTmuxNavigateRight<CR>", { silent = true })

-- Remover destaque da busca
-- vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>', { silent = true })


-- Atalhos de teclado para o Copilot Chat
vim.keymap.set('n', "<leader>zc", "<cmd>CopilotChat<CR>", { desc = "Abrir Chat do Copilot" })
vim.keymap.set('v', "<leader>ze", "<cmd>CopilotChatExplain<CR>", { desc = "Explique o Código selecionado" })
vim.keymap.set('v', "<leader>zr", "<cmd>CopilotChatReview<CR>", { desc = "Review Code" })
vim.keymap.set('v', "<leader>zf", "<cmd>CopilotChatFix<CR>", { desc = "Fix Code Issues" })
vim.keymap.set('v', "<leader>zo", "<cmd>CopilotChatOptimize<CR>", { desc = "Optimize Issues" })
vim.keymap.set('v', "<leader>zd", "<cmd>CopilotChatDocs<CR>", { desc = "Generate Docs" })
vim.keymap.set('v', "<leader>zt", "<cmd>CopilotChatTests<CR>", { desc = "Generate Tests" })
vim.keymap.set('n', "<C-r>", "<cmd>CopilotChatReset<CR>", { desc = "Reset Chat Windows" })
-- vim.keymap.set('n', "<leader>ze", function()
--     require("CopilotChat").ask_followup("Explique o código selecionado", { selection = require("CopilotChat.select").get_selection() })
-- end, { desc = "Copilot: Explicar código selecionado"})

-- Atalhos para dividir a tela (split) no estilo do Tmux
vim.keymap.set("n", "<leader>\"", "<cmd>split<CR>", { desc = "Split Horizontal (Tmux style)" })
vim.keymap.set("n", "<C-w>\"", "<cmd>split<CR>", { desc = "Split Horizontal (C-w)" })
vim.keymap.set("n", "<leader>%", "<cmd>vsplit<CR>", { desc = "Split Vertical (Tmux style)" })
vim.keymap.set("n", "<C-w>%", "<cmd>vsplit<CR>", { desc = "Split Vertical (C-w)" })

-- Mapear atalhos de dobras no modo normal
vim.keymap.set("n", "zA", "zR", { desc = "Abrir todas as dobras" })
vim.keymap.set("n", "zC", "zM", { desc = "Fechar todas as dobras" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--map("n", ";", ":", { desc = "CMD enter command mode" })
--map("i", "jk", "<ESC>")
