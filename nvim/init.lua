-- ============================================================================
-- Simple Neovim Configuration
-- ============================================================================

-- Set leader key FIRST (before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = false

-- Load core configuration modules
require('config.options')    -- Editor settings and options
require('config.keymaps')    -- Key mappings
require('config.autocmds')   -- Auto commands

-- Bootstrap and load lazy.nvim plugin manager
require('config.lazy')

-- vim: ts=2 sts=2 sw=2 et
