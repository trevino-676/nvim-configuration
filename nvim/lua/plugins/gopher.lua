return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'mfussenegger/nvim-dap',
  },
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  keys = {
    {
      '<leader>gatj',
      function()
        require('gopher').tags.add 'json'
      end,
      desc = 'Add json tags to struct',
    },
  },
}
