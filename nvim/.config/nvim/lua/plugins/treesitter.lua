return {
  "nvim-treesitter/nvim-treesitter", 
  build= ":TSUpdate",
  config = function ()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua", 
        "javascript", 
        "python",
        "css",
        "html",
        "bash",
        "scss",
        "typescript",
        "json",
        "ruby",
      },
      auto_install = false, -- Instalador automático de Color da Linguagem
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
