-- ~/.config/nvim/lua/custom/init.lua

-- Este é o arquivo principal de configuração customizada do Nvchad.
-- Ele é o ponto de entrada para todas as suas configurações pessoais.

---
-- Carrega as configurações de mapeamentos de teclado (atalhos)
-- que estão no seu arquivo 'mappings.lua'.
---
require("custom.mappings")

---
-- Configuração de Code Folding (Dobras de Código)
-- Usa o treesitter para dobrar o código com base na sintaxe da linguagem.
---
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevelstart = 99

-- Mapeamento de atalhos para abrir e fechar dobras de código.
-- 'za' abre ou fecha uma dobra.
vim.keymap.set("n", "za", "za", { noremap = true, silent = true, desc = "Alternar dobra" })

return {}
