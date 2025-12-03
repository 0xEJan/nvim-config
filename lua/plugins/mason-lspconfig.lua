return {
  "mason-org/mason-lspconfig.nvim",
  enabled = true,
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig"
  },
  opts = {
    ensure_installed = {
      "ansiblels",
    },
  }
}
