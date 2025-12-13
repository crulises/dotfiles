-- ============================================================================
-- AUTOCMDS.LUA - Automatic Commands
-- ============================================================================
-- Auto commands that run on specific events
-- See `:help lua-guide-autocommands` and `:help autocmd`
-- ============================================================================

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- ============================================================================
-- Highlight on Yank
-- ============================================================================
-- Briefly highlight text when yanking (copying)
-- Try it with `yap` in normal mode to copy a paragraph
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- ============================================================================
-- Auto-resize Splits
-- ============================================================================
-- Automatically resize splits when terminal is resized
autocmd('VimResized', {
  desc = 'Resize splits when terminal is resized',
  group = augroup('resize-splits', { clear = true }),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- ============================================================================
-- Close Certain Windows with 'q'
-- ============================================================================
-- Make it easy to close certain special windows with just 'q'
autocmd('FileType', {
  desc = 'Close certain filetypes with q',
  group = augroup('close-with-q', { clear = true }),
  pattern = {
    'help',
    'lspinfo',
    'man',
    'qf', -- Quickfix
    'checkhealth',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<CR>', { buffer = event.buf, silent = true })
  end,
})

-- ============================================================================
-- Remember Cursor Position
-- ============================================================================
-- When opening a file, jump to the last known cursor position
autocmd('BufReadPost', {
  desc = 'Go to last cursor position when opening a file',
  group = augroup('restore-cursor', { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
