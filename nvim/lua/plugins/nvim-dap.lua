return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    local opts = {
      delve = {
        detached = false,
      },
    }
    require('dap-go').setup(opts)
    require('dap').set_log_level 'TRACE'

    require('dap').adapters.go = function(callback, config)
      vim.defer_fn(function()
        callback {
          path = 'dlv',
          type = 'program',
          name = 'Debug',
          request = 'launch',
          program = '${file}',
          buildFlags = '--check-go-version=false',
        }
      end, 100)
    end
  end,
  keys = {
    { '<leader>db', '<cmd> DapToggleBreakpoint <CR>', desc = 'Add breakpoint at line' },
    {
      '<leader>dus',
      function()
        local widgets = require 'dap.ui.widgets'
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      desc = 'Open debugging sidebar',
    },
    {
      '<leader>dgt',
      function()
        require('dap-go').debug_test()
      end,
      desc = 'Debug go test',
    },
    {
      '<leader>dgl',
      function()
        require('dap-go').debug_last()
      end,
      desc = 'Debug last go test',
    },
  },
}
