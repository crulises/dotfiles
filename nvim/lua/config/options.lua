-- ============================================================================
-- OPTIONS.LUA - Editor Settings and Behavior
-- ============================================================================
-- All vim.opt settings are configured here
-- See `:help vim.opt` and `:help option-list` for more options
-- ============================================================================

local opt = vim.opt

-- ============================================================================
-- Line Numbers and Cursor
-- ============================================================================
opt.number = true         -- Show line numbers
opt.relativenumber = true -- Show relative line numbers (helps with motions)
opt.cursorline = true     -- Highlight the current line
opt.scrolloff = 10        -- Keep 10 lines above/below cursor when scrolling

-- ============================================================================
-- Indentation and Formatting
-- ============================================================================
opt.breakindent = true -- Wrapped lines maintain indent level
opt.expandtab = true   -- Use spaces instead of tabs
opt.shiftwidth = 2     -- Number of spaces for auto-indent
opt.tabstop = 2        -- Number of spaces for a tab
opt.smartindent = true -- Smart autoindenting on new lines

-- ============================================================================
-- Search Behavior
-- ============================================================================
opt.ignorecase = true    -- Case-insensitive search by default
opt.smartcase = true     -- Case-sensitive if search contains uppercase
opt.inccommand = 'split' -- Preview substitutions live as you type
opt.hlsearch = true      -- Highlight search results

-- ============================================================================
-- UI and Display
-- ============================================================================
opt.signcolumn = 'yes'   -- Always show sign column (prevents text shift)
opt.showmode = false     -- Don't show mode (shown in statusline)
opt.mouse = 'a'          -- Enable mouse support
opt.termguicolors = true -- Enable 24-bit RGB colors

-- Show whitespace characters
opt.list = true
opt.listchars = {
  tab = '» ', -- Tab character
  trail = '·', -- Trailing spaces
  nbsp = '␣' -- Non-breaking space
}

-- ============================================================================
-- Split Windows
-- ============================================================================
opt.splitright = true -- Vertical splits go to the right
opt.splitbelow = true -- Horizontal splits go below

-- ============================================================================
-- Performance and Behavior
-- ============================================================================
opt.updatetime = 250 -- Faster completion and cursor hold events (ms)
opt.timeoutlen = 150 -- Time to wait for mapped sequence (ms)
opt.undofile = true  -- Save undo history to file
opt.confirm = true   -- Ask for confirmation instead of failing
opt.swapfile = false -- Disable swap files (undo history is enough)

-- ============================================================================
-- Clipboard
-- ============================================================================
-- Sync clipboard between OS and Neovim
-- Scheduled after UiEnter to avoid startup delay
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- vim: ts=2 sts=2 sw=2 et
