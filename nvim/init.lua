-- INIT.LUA - Main Neovim Configuration Entry Point
-- This is a modular configuration based on kickstart.nvim
-- Configuration is split into logical modules for better organization

-- Set leader keys first (must happen before plugins load)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- If a Nerd Font is installed this can be set to true
vim.g.have_nerd_font = false

-- Load core configuration modules
require('config.options')    -- Editor settings and options
require('config.keymaps')    -- Key mappings
require('config.autocmds')   -- Auto commands

-- Bootstrap and load lazy.nvim plugin manager
require('config.lazy')

-- vim: ts=2 sts=2 sw=2 et
