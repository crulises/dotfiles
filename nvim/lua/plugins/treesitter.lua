-- ============================================================================
-- TREESITTER.LUA - Syntax Highlighting and Code Understanding
-- ============================================================================
-- Treesitter provides better syntax highlighting and code understanding
-- See `:help nvim-treesitter` for more information
-- ============================================================================

return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',  -- Run :TSUpdate after install/update
  event = { 'BufReadPost', 'BufNewFile' },  -- Load when opening files
  
  dependencies = {
    -- Optional: Show context at top of screen
    -- 'nvim-treesitter/nvim-treesitter-context',
  },
  
  config = function()
    require('nvim-treesitter.configs').setup({
      -- ========================================================================
      -- Language Parsers
      -- ========================================================================
      -- Languages to install automatically
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'vim',
        'vimdoc',
        'yaml',
        'json',
        -- Add more languages as needed:
        -- 'javascript', 'typescript', 'rust', 'go', 'cpp', etc.
      },
      
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      
      -- ========================================================================
      -- Syntax Highlighting
      -- ========================================================================
      highlight = {
        enable = true,  -- Enable treesitter-based highlighting
        
        -- Some languages depend on vim's regex highlighting
        -- Add them here if you experience issues
        additional_vim_regex_highlighting = { 'ruby' },
      },
      
      -- ========================================================================
      -- Indentation
      -- ========================================================================
      indent = {
        enable = true,
        disable = { 'ruby' },  -- Disable for problematic languages
      },
      
      -- ========================================================================
      -- Incremental Selection
      -- ========================================================================
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',      -- Start selection
          node_incremental = '<C-space>',    -- Expand selection
          scope_incremental = false,         -- Disabled
          node_decremental = '<bs>',         -- Shrink selection
        },
      },
    })
  end,
}

-- vim: ts=2 sts=2 sw=2 et
