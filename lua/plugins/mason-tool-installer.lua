return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  enabled = true,
  lazy = false,
  dependencies = {
    "mason-org/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "ansible-lint",
    },
  }
}
