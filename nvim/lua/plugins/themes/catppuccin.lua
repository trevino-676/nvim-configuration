return {
  'catppuccin/nvim',
  priority = 1000,
  name = 'catppuccin',
  config = function()
    local config = {
      flavour = 'auto',
      background = {
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false,
      show_end_of_buffer = false,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
      },
    }

    local catppuccin = require 'catppuccin'
    catppuccin.setup(config)
    catppuccin.load()
  end,
}
