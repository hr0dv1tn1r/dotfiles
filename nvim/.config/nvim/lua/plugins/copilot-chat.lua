return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    {
      "github/copilot.vim",
      lazy = false,
    },
  },
  lazy = false,
  build = 'make tiktoken',
  opts = {
    -- Configs
  },
}
