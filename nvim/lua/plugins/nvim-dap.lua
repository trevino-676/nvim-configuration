return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dap, dapui = require 'dap', require 'dapui'
    require('dap-go').setup()
    dapui.setup()
    dap.set_log_level 'TRACE'

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require('dap').adapters.go = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = { 'dap', '-1', '127.0.0.1:${port}' },
      },
    }
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
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Continue',
    },
  },
}
