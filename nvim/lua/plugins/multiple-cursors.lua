-- ============================================================================
-- MULTIPLE-CURSORS.LUA - Multiple Cursor Support
-- ============================================================================
-- Provides VSCode-like multiple cursor functionality
-- ============================================================================

return {
  'brenton-leighton/multiple-cursors.nvim',
  version = '*',
  event = 'VeryLazy',
  opts = {},
  
  -- Note: Some of these keybindings conflict with default window navigation
  -- You may want to customize them
  keys = {
    -- Add cursors vertically
    {
      '<C-Down>',
      '<Cmd>MultipleCursorsAddDown<CR>',
      mode = { 'n', 'i', 'x' },
      desc = 'Add cursor below'
    },
    {
      '<C-Up>',
      '<Cmd>MultipleCursorsAddUp<CR>',
      mode = { 'n', 'i', 'x' },
      desc = 'Add cursor above'
    },
    
    -- Add cursor with mouse
    {
      '<C-LeftMouse>',
      '<Cmd>MultipleCursorsMouseAddDelete<CR>',
      mode = { 'n', 'i' },
      desc = 'Add/remove cursor with mouse'
    },
    
    -- Add cursors to visual selection
    {
      '<Leader>ma',
      '<Cmd>MultipleCursorsAddVisualArea<CR>',
      mode = { 'x' },
      desc = 'Add cursors to visual area lines'
    },
    
    -- Find and add cursor to next match
    {
      '<Leader>md',
      '<Cmd>MultipleCursorsAddJumpNextMatch<CR>',
      mode = { 'n', 'x' },
      desc = 'Add cursor and jump to next match'
    },
    {
      '<Leader>mD',
      '<Cmd>MultipleCursorsJumpNextMatch<CR>',
      mode = { 'n', 'x' },
      desc = 'Jump to next match'
    },
    
    -- Lock/unlock cursors
    {
      '<Leader>ml',
      '<Cmd>MultipleCursorsLock<CR>',
      mode = { 'n', 'x' },
      desc = 'Lock virtual cursors'
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
