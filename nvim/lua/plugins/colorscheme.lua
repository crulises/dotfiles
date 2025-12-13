-- ============================================================================
-- COLORSCHEME.LUA - Color Scheme Configuration
-- ============================================================================
-- Defines the color scheme for the editor
-- See `:Telescope colorscheme` to browse installed schemes
-- ============================================================================

return {
  'folke/tokyonight.nvim',
  priority = 1000, -- Load before other plugins to avoid color issues
  
  config = function()
    -- Configure the colorscheme
    require('tokyonight').setup({
      style = 'night',  -- Options: night, storm, day, moon
      
      styles = {
        comments = { italic = false },  -- Disable italic comments
        keywords = { italic = false },
        functions = {},
        variables = {},
      },
      
      -- Adjust transparency
      transparent = false,  -- Set to true for transparent background
      
      -- Dim inactive windows
      dim_inactive = false,
    })
    
    -- Apply the colorscheme
    vim.cmd.colorscheme('tokyonight-night')
  end,
}

-- Alternative colorschemes (uncomment to try):
-- return { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }
-- return { 'rose-pine/neovim', name = 'rose-pine', priority = 1000 }
-- return { 'rebelot/kanagawa.nvim', priority = 1000 }

-- vim: ts=2 sts=2 sw=2 et
