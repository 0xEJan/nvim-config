return {
  -- Allows folding of codeblocks
  'kevinhwang91/nvim-ufo',
  dependencies = {
    { 'kevinhwang91/promise-async', version = '*' },
  },

  keys = {
    { "zR", function() require('ufo').openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require('ufo').openAllFolds() end, desc = "Close all folds" },
    { "zc", desc = "Close fold" },
    { "zo", desc = "Open fold" },
  },

 config = function()
    -- Folding settings
    vim.o.foldcolumn = '1' -- Show fold column
    vim.o.foldlevel = 99 -- Keep folds open by default
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    -- UFO setup: treesitter first, indent fallback
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end
    })
    -- Add group definition to which-key
    local wk = require('which-key')
    wk.add({
      { 'z', group = 'Code folding' },
    })
  end,
}
