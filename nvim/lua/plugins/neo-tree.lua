return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle file explorer' },
  },
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true,
      window = {
        width = 30,
      },
    })
  end
}
