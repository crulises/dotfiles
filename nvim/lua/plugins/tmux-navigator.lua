-- ============================================================================
-- TMUX-NAVIGATOR.LUA - Seamless Tmux/Vim Navigation
-- ============================================================================
-- Navigate seamlessly between tmux panes and vim splits
-- Only useful if you use tmux - can safely remove if you don't
-- ============================================================================

return {
  'christoomey/vim-tmux-navigator',
  
  -- Only load when using tmux
  cond = function()
    return vim.env.TMUX ~= nil
  end,
  
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  
  keys = {
    { '<C-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Navigate left (tmux)' },
    { '<C-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Navigate down (tmux)' },
    { '<C-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Navigate up (tmux)' },
    { '<C-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Navigate right (tmux)' },
    { '<C-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', desc = 'Navigate previous (tmux)' },
  },
}

-- Note: If you don't use tmux, you can delete this file entirely

-- vim: ts=2 sts=2 sw=2 et
