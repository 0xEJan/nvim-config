return {
  { -- Adds a fuzzy finder written in lua to neovim
    "nvim-telescope/telescope.nvim",
    enabled = true,
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
      },
    },
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<CR>", desc = "[S]earch [F]iles" },
      { "<leader>sh", "<cmd>Telescope help_tags<CR>", desc = "[S]earch [H]elp" },
      { "<leader>sg", "<cmd>Telescope live_grep<CR>", desc = "[S]earch by [G]rep" },
      { "<leader>sw", "<cmd>Telescope grep_string<CR>", desc = "[S]earch current [W]ord" },
    },
    opts = {
      spec = {
        {},
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      -- Enable telescope extensions when they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
      pcall(require("telescope").load_extension, "live_grep_args")

      -- Add group definition to which-key
      local wk = require("which-key")
      wk.add({
        { "<leader>s", group = "[S]earch" },
      })
    end,
  },
}
