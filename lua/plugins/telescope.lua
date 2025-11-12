return {
  { -- Adds a fuzzy finder written in lua to neovim
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      'nvim-telescope/telescope-ui-select.nvim',
    },
    keys = {
     { '<leader>ff', '<cmd>Telescope find_files<CR>', desc = 'Fuzzy Find files' },
     { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Fuzzy Find help' },
    },
    opts = {
      spec = {
        {
        },
      },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }
      -- Enable telescope extensions when they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Add group definition to which-key
      local wk = require('which-key')
      wk.add({
        { '<leader>f', group = 'file/find' },
      })
    end,
  },
}

