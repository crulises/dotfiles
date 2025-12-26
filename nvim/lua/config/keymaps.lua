-- ============================================================================
-- Keymaps - All shortcuts in one place
-- ============================================================================

local keymap = vim.keymap.set

-- ============================================================================
-- GENERAL
-- ============================================================================

-- Clear search highlights
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Save file
keymap('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Quit
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })

-- Save and quit
keymap('n', '<leader>x', '<cmd>wq<CR>', { desc = 'Save and quit' })

-- ============================================================================
-- WINDOW NAVIGATION
-- ============================================================================

keymap('n', '<C-h>', '<C-w>h', { desc = 'Move to left window' })
keymap('n', '<C-j>', '<C-w>j', { desc = 'Move to bottom window' })
keymap('n', '<C-k>', '<C-w>k', { desc = 'Move to top window' })
keymap('n', '<C-l>', '<C-w>l', { desc = 'Move to right window' })

-- ============================================================================
-- WINDOW MANAGEMENT
-- ============================================================================

keymap('n', '<leader>sv', '<C-w>v', { desc = 'Split vertically' })
keymap('n', '<leader>sh', '<C-w>s', { desc = 'Split horizontally' })
keymap('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal' })
keymap('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- ============================================================================
-- BUFFER NAVIGATION
-- ============================================================================

keymap('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
keymap('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- ============================================================================
-- TEXT EDITING
-- ============================================================================

-- Move selected lines up/down
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Keep cursor in place when joining lines
keymap('n', 'J', 'mzJ`z', { desc = 'Join lines' })

-- Center screen when scrolling
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Center screen when searching
keymap('n', 'n', 'nzzzv', { desc = 'Next search result' })
keymap('n', 'N', 'Nzzzv', { desc = 'Previous search result' })

-- Paste without losing register
keymap('x', '<leader>p', '"_dP', { desc = 'Paste without losing register' })

-- Better indenting
keymap('v', '<', '<gv', { desc = 'Indent left' })
keymap('v', '>', '>gv', { desc = 'Indent right' })

-- ============================================================================
-- TERMINAL
-- ============================================================================

-- Exit terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- ============================================================================
-- DIAGNOSTICS
-- ============================================================================

keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error' })
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
