-- ============================================================================
-- KEYMAPS.LUA - Keyboard Shortcuts and Mappings
-- ============================================================================
-- All key mappings are defined here
-- See `:help vim.keymap.set()` for more information
-- Format: vim.keymap.set(mode, key, action, { desc = 'Description' })
-- ============================================================================

local keymap = vim.keymap.set

-- ============================================================================
-- General Mappings
-- ============================================================================

-- Clear search highlights with <Esc> in normal mode
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Better save and quit shortcuts
keymap('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })
keymap('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
keymap('n', '<leader>Q', '<cmd>qa<CR>', { desc = 'Quit all' })

-- ============================================================================
-- Window Navigation
-- ============================================================================
-- Use CTRL+<hjkl> to switch between windows
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Window resizing
keymap('n', '<C-Up>', '<cmd>resize +2<CR>', { desc = 'Increase window height' })
keymap('n', '<C-Down>', '<cmd>resize -2<CR>', { desc = 'Decrease window height' })
keymap('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Decrease window width' })
keymap('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Increase window width' })

-- Window splitting
keymap('n', '<leader>sh', '<cmd>split<CR>', { desc = 'Split horizontal'})
keymap('n', '<leader>sv', '<cmd>vsplit<CR>', { desc = 'Split vertical'})
keymap('n', '<leader>s=', '<C-w>=', { desc = 'Equalize windows'})

-- ============================================================================
-- Terminal Mode
-- ============================================================================
-- Exit terminal mode easier (normally requires <C-\><C-n>)
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Terminal navigation (same as normal mode)
keymap('t', '<C-h>', '<cmd>wincmd h<CR>', { desc = 'Move to left window' })
keymap('t', '<C-j>', '<cmd>wincmd j<CR>', { desc = 'Move to lower window' })
keymap('t', '<C-k>', '<cmd>wincmd k<CR>', { desc = 'Move to upper window' })
keymap('t', '<C-l>', '<cmd>wincmd l<CR>', { desc = 'Move to right window' })

-- ============================================================================
-- Visual Mode - Better Indenting
-- ============================================================================
-- Stay in visual mode when indenting
keymap('v', '<', '<gv', { desc = 'Indent left and reselect' })
keymap('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- ============================================================================
-- Better Line Movement
-- ============================================================================
-- Move lines up and down in visual mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
keymap('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Keep cursor in place when joining lines
keymap('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })

-- ============================================================================
-- Better Vertical Movement
-- ============================================================================
-- Center screen after vertical movements
keymap('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
keymap('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })
keymap('n', 'n', 'nzzzv', { desc = 'Next search result and center' })
keymap('n', 'N', 'Nzzzv', { desc = 'Previous search result and center' })

-- ============================================================================
-- Buffer Navigation
-- ============================================================================
keymap('n', '<S-h>', '<cmd>bprevious<CR>', { desc = 'Go to previous buffer' })
keymap('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
keymap('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- vim: ts=2 sts=2 sw=2 et
